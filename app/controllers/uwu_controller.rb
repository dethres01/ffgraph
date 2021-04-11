
class UwuController < ApplicationController  
  before_action :get_logs, only: [:search,:graph] 
  def index
  end
  def search
    
    @report = params[:log]
    #shdajksdh
    unless @logs
      flash[:alert] = "Log not found"
      return render action: :index
    end

  end
  def graph
    unless @logs
      flash[:alert] = "Error Getting logs"
      return render action: :index
    end
    @garuda_series,@ifrit_series,@titan_series,@intermission_series,@ultima_series=parse_data(@logs)

  end
  private

  def get_logs
    @logs = UwuLogparsingService.find_report(params[:log])
  end
  def parse_data(logs)
    garuda= Array.new
    ifrit = Array.new
    titan = Array.new
    lahabrea = Array.new
    ultima = Array.new
    logs.each do |i|
      if i["boss"]==1048
        case i['lastPhaseForPercentageDisplay']
        when 1
          garuda.push([i["id"],i['fightPercentage']])
        when 2
          ifrit.push([i["id"],i['fightPercentage']])
        when 3
          titan.push([i["id"],i['fightPercentage']])
        when 4
          lahabrea.push([i["id"],i['fightPercentage']])
        when 5
          ultima.push([i["id"],i['fightPercentage']])
        end
      end
    end
    return garuda, ifrit, titan, lahabrea, ultima
  end
end  