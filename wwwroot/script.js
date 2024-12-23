const log = console.log

const url = "https://localhost:7189/WeatherForecast";

fetch(url)
  .then(res=>res.json())
  .then(data=>log(data))
  .catch(e=>{
    log(e)
  })