(window.webpackJsonp=window.webpackJsonp||[]).push([[436],{1191:function(e,t){e.exports=function(e){e.options.__i18n=e.options.__i18n||[],e.options.__i18n.push('{"en":{"SAVETHISPAGE":"Save this page to My Closet?"},"zh":{"SAVETHISPAGE":"保存这个网页到我的衣橱？"}}'),delete e.options._Ctor}},1631:function(e,t,n){var content=n(2458);content.__esModule&&(content=content.default),"string"==typeof content&&(content=[[e.i,content,""]]),content.locals&&(e.exports=content.locals);(0,n(126).default)("23966473",content,!0,{sourceMap:!1})},2457:function(e,t,n){"use strict";n(1631)},2458:function(e,t,n){var r=n(125)(!1);r.push([e.i,".searchres-container[data-v-40461d11]{min-height:210px;background:#fff;width:350px;overflow-y:auto}.searchres-container .savepage-box[data-v-40461d11]{margin:10px 10px 0;letter-spacing:.2px}.searchres-container .no-save-btn[data-v-40461d11]{margin:7px 10px 0}.searchres-container .no-save-btn .btn[data-v-40461d11]{padding:6px 15px 4px}.searchres-container.noresult[data-v-40461d11]{min-height:unset}.searchres-container[data-v-40461d11]::-webkit-scrollbar{width:6px}.searchres-container .searchres-scroll-con[data-v-40461d11]{padding:0 10px;overflow-x:hidden}.searchres-container .searchres-scroll-con[data-v-40461d11]::-webkit-scrollbar{width:6px}.searchres-container .searchres-box[data-v-40461d11]{padding:5px 0 0;overflow:hidden}.searchres-container .searchres-box.prd-searchres-box[data-v-40461d11]{max-height:350px;overflow-y:scroll}.searchres-container .searchres-box.prd-searchres-box.hasoffer[data-v-40461d11]{max-height:206px}.searchres-container .searchres-box.resrow-1[data-v-40461d11]{max-height:38px}.searchres-container .searchres-box.resrow-2[data-v-40461d11]{max-height:70px}.searchres-container .searchres-item[data-v-40461d11]{padding:10px 0}[data-v-40461d11] #extention_coupon .swiper-slide{overflow:hidden}@media (max-width:1199px){.searchres-container[data-v-40461d11]{top:0;width:100%!important;box-shadow:unset;filter:drop-shadow(0 4px 4px rgba(0,0,0,.25))}}[data-v-40461d11] .swiper-button-next.is_bottom,[data-v-40461d11] .swiper-button-prev.is_bottom{width:20px;bottom:0}[data-v-40461d11] .swiper-button-next /deep/ .swiper-button-prev.is_bottom,[data-v-40461d11] .swiper-button-prev /deep/ .swiper-button-prev.is_bottom{left:0}[data-v-40461d11] .extention_coupon_fraction{color:#555;bottom:23px}[data-v-40461d11]::-webkit-scrollbar{display:none}",""]),e.exports=r},2459:function(e,t,n){"use strict";var r=n(1191),o=n.n(r);t.default=o.a},3301:function(e,t,n){"use strict";n.r(t);var r=n(2),o=n(17),c=(n(28),n(13),n(53),n(45),n(281),n(24),n(16),n(46),n(37),n(47),n(94),n(39),n(65),n(22)),l={components:{BaseSwiper:function(){return Promise.all([n.e(1),n.e(9)]).then(n.bind(null,438))},ProductCardWide:function(){return Promise.all([n.e(1),n.e(337)]).then(n.bind(null,3194))},Coupon:function(){return n.e(87).then(n.bind(null,779))},LoadingLayer:function(){return n.e(0).then(n.bind(null,446))}},props:{hintsfor:{type:String,default:function(){return"NAVI2"}},source:{type:String,default:function(){return""}},needresetheight:{type:Boolean,default:function(){return!0}},is_pc:{type:Boolean,default:function(){return!0}},component_type:{type:String,default:function(){return"extension"}}},setup:function(e,t){for(var l=t.root,d=(t.refs,Object(c.a)((function(){return l.$route.query.link||""}))),h=Object(c.a)((function(){return l.$nuxt.$store.state.listalertmd.openlistalertmd})),f=Object(c.m)(null),v=Object(c.m)(!1),x=[].concat(Object(o.a)(l.$gconfig.TESTDOMAIN),["modesens.com","modesens.cn"]),m=decodeURIComponent(d.value).replace(/^(http|https):\/\//,"").replace(/\/$/,""),_=Object(c.m)(d.value&&x.includes(m)||null),w=Object(c.m)(""),y=Object(c.m)(!_.value),C=Object(c.m)(""),O=!1,i=0;i<x.length;i++)decodeURIComponent(d.value).startsWith("https://".concat(x[i]))&&(O=!0);var j=function(){var t=Object(r.a)(regeneratorRuntime.mark((function t(){var data,r,o;return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return y.value=!0,(data={}).query=d.value,data.hintsfor=e.hintsfor,data.timestamp=(new Date).getTime()+"",C.value=data.timestamp,r=n(206),(0,r.searchBoxGA4Event)("hint",e.component_type,d.value),t.next=10,l.$axios.post("/hint3/",data);case 10:o=t.sent,S(),o.error?w.value=o.error:o.sections&&o.sections.length?(f.value=[],o.sections.map((function(e){if("savepage"===e.type){var t=d.value.match(/http[s]?:\/\/([^/?#]+)/);t&&(t=t[1],_.value={cta:e.cta,domain:t})}else"offers"===e.type&&e.offers.length>0&&(v.value=!0),f.value.push(e)}))):o.redirect,y.value=!1;case 14:case"end":return t.stop()}}),t)})));return function(){return t.apply(this,arguments)}}(),S=function(){f.value=null,_.value=null,w.value=""},k=function(){var e=Object(r.a)(regeneratorRuntime.mark((function e(){return regeneratorRuntime.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,j();case 2:case"end":return e.stop()}}),e)})));return function(){return e.apply(this,arguments)}}();return Object(c.i)((function(){d.value&&!x.includes(m)&&k()})),Object(c.n)(h,(function(){h.value?document.querySelector(".searchres-box.prd-searchres-box").style.maxHeight=v.value?"".concat(screen.height-390,"px "):"".concat(screen.height-200,"px"):document.querySelector(".searchres-box.prd-searchres-box").style.maxHeight=v.value?"".concat(168,"px "):"".concat(350,"px")})),{sections:f,hasoffer:v,savepage:_,has_domain:O,errMsg:w,searchLoading:y,savePage:function(){l.$store.state.login_status?l.$route.query.isextension&&window.parent.postMessage("save","*"):l.$signup_click("save")}}}},d=l,h=(n(2457),n(99)),f=n(2459),component=Object(h.a)(d,(function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{ref:"searchres-container",class:"scrollbar-hidden searchres-container position-relative float-right "+(e.searchLoading||e.errMsg||e.savepage||e.sections?"":"noresult")},[e.errMsg?n("div",{staticClass:"py-4 text-center"},[n("div",[e._v(e._s(e.errMsg))])]):e._e(),e._v(" "),e.searchLoading?e._e():n("div",[e.savepage||e.has_domain?n("div",{ref:"savepage-box",staticClass:"d-flex justify-content-between align-items-center no-save-btn"},[n("div",[e._v(e._s(e.$t("SAVETHISPAGE")))]),e._v(" "),n("button",{staticClass:"btn btn-primary font-size-sm",on:{click:e.savePage}},[e._v(e._s(e.$t("COMMON.SAVE")))])]):n("div",{ref:"savepage-box",staticClass:"font-size-sm savepage-box"},[n("b",[e._v("You've made a rare find!")]),e._v(" "),n("div",{staticClass:"font-weight-light"},[e._v(e._s("Shop with confidence! Check ModeSens before you buy to find coupons and compare our "+e.$store.state.statistics.store_cnt_fmt+" partner stores for the best price."))])]),e._v(" "),e.sections&&e.sections.length?n("div",{ref:"searchres-scroll-con",staticClass:"searchres-scroll-con"},e._l(e.sections,(function(section,i){return n("div",{key:i+"-"+section.type,staticClass:"searchres-item"},["products"===section.type||"prdmini"===section.type?n("ul",{class:"searchres-box prd-searchres-box "+(e.hasoffer?"hasoffer":"")},e._l(section.products,(function(t,r){return n("ProductCardWide",{key:r,class:"border-0 "+(r===section.products.length-1?"":"mb-3"),attrs:{product:t,haspadding:!0,gtm_ext:e.source}})})),1):"offers"===section.type?n("ul",{staticClass:"searchres-box coupons"},[n("BaseSwiper",{attrs:{bottom_arrow:!0,swiperid:"extention_coupon",leftclass:section.offers.length>1||Object.keys(section.offers).length>1?"extention_coupon_left":"",rightclass:section.offers.length>1||Object.keys(section.offers).length>1?"extention_coupon_right":"",pagination_class:section.offers.length>1?"extention_coupon_fraction":"",autoplay:!1,noswiping:1===section.offers.length,pagination_type:"fraction"}},e._l(section.offers,(function(e,t){return n("Coupon",{key:t,staticClass:"swiper-slide offer-item mb-3 w-100",attrs:{coupon:e}})})),1)],1):e._e()])})),0):e._e()]),e._v(" "),e.searchLoading?n("LoadingLayer",{staticClass:"position-absolute w-100 h-100",attrs:{position:"center"}}):e._e()],1)}),[],!1,null,"40461d11",null);"function"==typeof f.default&&Object(f.default)(component);t.default=component.exports}}]);