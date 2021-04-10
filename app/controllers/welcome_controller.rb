
class WelcomeController < ApplicationController  
  def index
  end
  def search
    @logs = find_report(params[:log])

    unless @logs
      flash[:alert] = "Log not found"
      return render action: :index
    end

  end

  private
  def request_api(url)
    #url = https://www.fflogs.com/v1/report/fights/
    #this will go to an ENV 
    
    response = Excon.get("#{url}/?api_key=#{ENV["api_key"]}")
    return nil if response.status != 200
    payload = JSON.parse(response.body).to_a
    payload = payload[0]
    
    payload =payload[1]
    return payload
  end
  def find_report(report)
    request_api("https://www.fflogs.com/v1/report/fights/#{report}")
  end
end  