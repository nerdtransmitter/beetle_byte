//写cookies
function setCookie(name, value, days = 30) {
  var exp = new Date()
  exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000)
  document.cookie = `${name}=${encodeURIComponent(
    value
  )};expires=${exp.toGMTString()};path=/`
}

//读取cookies
function getCookie(name) {
  var reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)')
  var arr = document.cookie.match(reg)
  if (arr) return decodeURIComponent(arr[2])
  else return null
}

//删除cookies
function delCookie(name) {
  //获取cookie
  var data = getCookie(name)
  //如果获取到cookie则重新设置cookie的生存周期为过去时间
  if (data) {
    setCookie(name, data, -1)
  }
}

window.dataLayer = window.dataLayer || []
function gtag() {
  dataLayer.push(arguments)
}
gtag('js', new Date())

// let configData = {}
// let lsuid = getCookie('lsuid')
// if (lsuid) {
//   configData.user_id = lsuid
// }
// gtag('config', 'G-DJWKGXM3TP', configData)
gtag('config', 'G-DJWKGXM3TP')

gtag('get', 'G-DJWKGXM3TP', 'session_id', id => {
  let key = 'gsid'
  let osid = getCookie(key)
  if (osid !== id) {
    delCookie(key)
    setCookie(key, id, 1)
  }
})
gtag('get', 'G-DJWKGXM3TP', 'client_id', id => {
  let key = 'gcid'
  let ocid = getCookie(key)
  if (ocid !== id) {
    delCookie(key)
    setCookie(key, id, 30)
  }
})

function gtagEvent(eventName, parameters) {
  let _parameters = { ...parameters }
  if (!_parameters.page_type) {
    _parameters.page_type = window.$nuxt.$route.path
  }
  gtag('event', eventName, {
    ..._parameters
  })
}
