
class UwuLogparsingService
  def self.request_api(url)
    response = Excon.get("#{url}/?api_key=#{ENV["api_key"]}")
    return nil if response.status != 200
    payload = JSON.parse(response.body).to_a
    payload = payload[0]
    
    payload =payload[1]
    counter = 0
    payload.delete_if { |k| k["boss"]!=1048}
    #binding.pry
    for i in 0...payload.size
        counter += 1
        payload[i]["id"]= counter
        payload[i]['fightPercentage'] = (10000-payload[i]['fightPercentage'])/100.0
    end
    #binding.pry
    return payload
  end
  def self.find_report(report)
    request_api("https://www.fflogs.com/v1/report/fights/#{report}")
  end
end