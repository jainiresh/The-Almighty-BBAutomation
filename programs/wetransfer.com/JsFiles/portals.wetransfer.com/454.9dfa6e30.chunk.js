"use strict";(self.webpackChunkensemble_client=self.webpackChunkensemble_client||[]).push([[454],{80753:function(e,a,t){t.d(a,{h:function(){return s}});var r=t(8990),n=(t(76474),t(80184));function s(){return(0,n.jsx)(r.hM,{currentAppId:r.QK.WeTransfer,openOnClick:!0,children:(0,n.jsx)(r.V4,{})})}},89985:function(e,a,t){t.d(a,{q:function(){return c}});var r=t(1413),n=t(81694),s=t.n(n),i=t(72791),o={avatar:"Avatar_avatar__qbz0B","extra-extra-small":"Avatar_extra-extra-small__kSUGO","extra-small":"Avatar_extra-small__K-MQ9",small:"Avatar_small__rIB8f",medium:"Avatar_medium__-kSqy",large:"Avatar_large__hIyYo","extra-large":"Avatar_extra-large__vZWoa","extra-extra-large":"Avatar_extra-extra-large__HLlOq"},l=t(80184),u=[{backgroundColor:"#d5f0de",color:"#03502c"},{backgroundColor:"#d0e2ff",color:"#2122ac"},{backgroundColor:"#ffe8b4",color:"#5b3b04"},{backgroundColor:"#fddede",color:"#771111"},{backgroundColor:"#ffd5b8",color:"#6a1c04"},{backgroundColor:"#dfd8fa",color:"#5115aa"}],c=(0,i.forwardRef)((function(e,a){var t=e.appearance,n=void 0===t?"round":t,i=e.backgroundColor,c=e.className,d=e.color,p=e.copy,_=void 0===p?"WT":p,v=e.imageUrl,f=void 0===v?"":v,h=e.size,m=void 0===h?"small":h,x=e.style,w=function(e){var a=(e.charCodeAt(0)||1)+(e.charCodeAt(1)||1);return u[a%u.length]}(_),b=w.backgroundColor,g=w.color,I=i||b;f&&(I="");var k=(0,r.Z)({color:d||g,backgroundColor:I,backgroundImage:"url(".concat(f,")")},x),C=s()(c,o.avatar,o[m],o[n]);return(0,l.jsx)("div",{"data-test-id":"avatar",role:"img",className:C,style:k,ref:a,children:!f&&_})}))},77176:function(e,a,t){t.d(a,{o:function(){return _}});var r=t(1413),n=t(4942),s=t(45987),i=t(81694),o=t.n(i),l=t(72791),u=t(19055),c={background:"TextInput_background__+UMsG",wrapper:"TextInput_wrapper__h7UEo",label:"TextInput_label__FbhVk",withValue:"TextInput_withValue__wbOc8",container:"TextInput_container__v3Vwk",error:"TextInput_error__Yw5m1",info:"TextInput_info__0Oe2L",disabled:"TextInput_disabled__7b2op",input:"TextInput_input__YOUtH",withLabel:"TextInput_withLabel__7l80m",textarea:"TextInput_textarea__PEPzQ",prefix:"TextInput_prefix__WDyhJ",suffix:"TextInput_suffix__9ra1w",hint:"TextInput_hint__e1alm",icon:"TextInput_icon__zAwCY",fadeInAnimation:"TextInput_fadeInAnimation__x1ATW",fadeOutAnimation:"TextInput_fadeOutAnimation__RHu1I",moveUp:"TextInput_moveUp__NEXKx",spin:"TextInput_spin__OshjM",pulse:"TextInput_pulse__CDirW",bgColorPulse:"TextInput_bgColorPulse__p-6Ss"},d=t(80184),p=["className","prefix","suffix","multiline","status","hint","disabled","inputClassName","backgroundClassName","label","id","value"],_=(0,l.forwardRef)((function(e,a){var t,i=e.className,l=e.prefix,_=e.suffix,v=e.multiline,f=void 0!==v&&v,h=e.status,m=e.hint,x=e.disabled,w=e.inputClassName,b=e.backgroundClassName,g=e.label,I=e.id,k=e.value,C=(0,s.Z)(e,p),N=f?"textarea":"input",j=o()(c.background,h&&c[h],(0,n.Z)({},c.disabled,x),b),P=o()(c.label,(0,n.Z)({},c.withValue,!!k)),T=o()(c.input,(t={},(0,n.Z)(t,c.disabled,x),(0,n.Z)(t,c.withLabel,!!g),t),w);return(0,d.jsxs)("div",{className:c.wrapper,children:[(0,d.jsxs)("div",{className:o()(c.container,(0,n.Z)({},c.textarea,f),i),children:[g&&(0,d.jsx)("label",{htmlFor:I,className:P,children:g}),(0,d.jsx)(N,(0,r.Z)((0,r.Z)({},C),{},{id:I,value:k,className:T,ref:a,rows:6,disabled:x})),(0,d.jsx)("div",{className:j}),l&&(0,d.jsx)("div",{className:c.prefix,children:l}),_&&(0,d.jsx)("div",{className:c.suffix,children:_})]}),h&&m&&(0,d.jsxs)("div",{className:o()(c.hint,c[h]),"data-test-id":"textInput.hint",children:["info"!==h&&(0,d.jsx)("span",{className:c.icon,children:"error"===h?(0,d.jsx)(u.$Q,{size:"small"}):""}),m]})]})}))},70005:function(e,a,t){t.d(a,{W:function(){return _}});var r=t(72791),n=t(39230),s=t(80753),i=t(89985),o=t(24566),l=t(19055),u=t(54715),c=t(77176),d={loaderContainer:"Passphrase_loaderContainer__fRkiW",header:"Passphrase_header__Eje7l",main:"Passphrase_main__NfViR",button:"Passphrase_button__e9xRE",widthContainer:"Passphrase_widthContainer__JfhGh",content:"Passphrase_content__ynNQK",icons:"Passphrase_icons__lwLUb",slash:"Passphrase_slash__IxiUt",title:"Passphrase_title__PCkKB",text:"Passphrase_text__TsmHr",inputWrapper:"Passphrase_inputWrapper__FN2sE"},p=t(80184);function _(e){var a=e.passphrase,t=e.onChange,_=e.title,v=e.avatarUrl,f=e.ownerName,h=e.isAuthenticating,m=e.isLoading,x=e.logoUrl,w=e.status,b=e.onSubmit,g=e.isMasterPassphrase,I=void 0!==g&&g,k=(0,n.$G)().t,C=""===a||h,N=(0,r.useCallback)((function(e){e.preventDefault(),C||null===b||void 0===b||b()}),[C,b]);return m?(0,p.jsx)("div",{className:d.loaderContainer,"data-test-id":"passphrase.loading",children:(0,p.jsx)(u.a,{})}):(0,p.jsxs)(p.Fragment,{children:[(0,p.jsx)("div",{className:d.header,children:(0,p.jsx)(s.h,{})}),(0,p.jsx)("div",{className:d.main,children:(0,p.jsx)("div",{className:d.widthContainer,children:(0,p.jsxs)("div",{className:d.content,children:[(0,p.jsxs)("div",{className:d.icons,children:[(0,p.jsx)(i.q,{size:"medium",imageUrl:v}),x?(0,p.jsxs)(p.Fragment,{children:[(0,p.jsx)(l.Tm,{className:d.slash}),(0,p.jsx)(i.q,{size:"medium",imageUrl:x})]}):null]}),(0,p.jsx)("p",{className:d.text,children:k("passphrase.owner",{owner:f})}),(0,p.jsx)("p",{className:d.title,children:_}),(0,p.jsx)("p",{className:d.text,children:k(I?"passphrase.master_description":"passphrase.description",{owner:f})}),(0,p.jsxs)("form",{onSubmit:N,children:[(0,p.jsx)("div",{className:d.inputWrapper,children:(0,p.jsx)(c.o,{type:"text",className:d.input,value:a,prefix:(0,p.jsx)(l.Z0,{size:"small"}),placeholder:k("passphrase.placeholder"),onChange:function(e){function a(a){return e.apply(this,arguments)}return a.toString=function(){return e.toString()},a}((function(e){return t(e.target.value)})),status:w,hint:k("passphrase.incorrect_password"),"data-test-id":"passphrase.input"})}),(0,p.jsx)(o.LE,{appearance:"primary",type:"submit",className:d.button,disabled:C,"data-test-id":"passphrase.submit",children:k("passphrase.submit")})]})]})})})]})}},12608:function(e,a,t){t.d(a,{g:function(){return u}});var r,n=t(29439),s=t(30168),i=t(45984),o=t(45726),l=(0,i.Ps)(r||(r=(0,s.Z)(["\n  query PortalQueryByPortalId($portalId: String!) {\n    portal: reviewCollection(id: $portalId) {\n      publicId\n      title\n      logoUrl\n      passwordProtected\n      teamId\n    }\n  }\n"])));function u(e){var a,t=(0,o.aM)({query:l,variables:{portalId:e},pause:!e}),r=(0,n.Z)(t,1)[0],s=r.data,i=r.fetching;return{portal:null!==(a=null===s||void 0===s?void 0:s.portal)&&void 0!==a?a:null,isFetchingPortal:i}}},30394:function(e,a,t){t.r(a),t.d(a,{default:function(){return Z}});var r,n=t(15861),s=t(29439),i=t(64687),o=t.n(i),l=t(72791),u=t(39230),c=t(59434),d=t(57689),p=t(9911),_=t(68899),v=t(66893),f=t(36106),h=t(52662),m=t(70005),x=t(12608),w=t(30168),b=t(45984),g=t(45726),I=(0,b.Ps)(r||(r=(0,w.Z)(["\n  query ReviewQuery($reviewId: String!) {\n    review(id: $reviewId) {\n      passwordProtected\n      title\n      teamId\n      reviewCollectionId\n    }\n  }\n"])));var k,C=t(4942),N=t(26342),j=t(27029),P=(0,b.Ps)(k||(k=(0,w.Z)(["\n  mutation CheckReviewPassword($id: String!, $password: String!) {\n    checkReviewPassword(id: $id, password: $password) {\n      accessToken: accessToken\n    }\n  }\n"])));var T=t(80184);function Z(){var e=(0,l.useState)(""),a=(0,s.Z)(e,2),t=a[0],r=a[1],i=(0,l.useState)(!0),w=(0,s.Z)(i,2),b=w[0],k=w[1],Z=(0,l.useState)(),y=(0,s.Z)(Z,2),A=y[0],E=y[1],S=(0,c.v9)(h.Se),R=(0,c.v9)(h.BX),U=(0,d.UO)().reviewId,W=function(e){var a,t=(0,l.useMemo)((function(){return{additionalTypenames:["ActionRequest"]}}),[]),r=(0,g.aM)({query:I,variables:{reviewId:e},pause:!e,context:t}),n=(0,s.Z)(r,1)[0],i=n.data,o=n.fetching;return{review:null!==(a=null===i||void 0===i?void 0:i.review)&&void 0!==a?a:null,isFetchingReview:o}}(U||null),O=W.review,F=W.isFetchingReview,V=(0,x.g)(null===O||void 0===O?void 0:O.reviewCollectionId),$=V.portal,q=V.isFetchingPortal,L=function(e,a){var t=(0,u.$G)().t,r=(0,j.Fn)(),i=r.fireEvent,c=r.fireErrorEvent,d=(0,l.useState)(!1),p=(0,s.Z)(d,2),f=p[0],h=p[1],m=(0,g.Db)(P),x=(0,s.Z)(m,2),w=x[0].fetching,b=x[1];function I(a){var t;i({eventName:j.B_.PASSPHRASE_ENTERED,optionalEventProperties:(t={},(0,C.Z)(t,j.r8.LOCATION,j.sR.REVIEW),(0,C.Z)(t,j.r8.UNLOCK_SUCCESS,a),t),groups:(0,C.Z)({},j.YT.REVIEW,e)})}var k=function(){var r=(0,n.Z)(o().mark((function r(){var n,s,i;return o().wrap((function(r){for(;;)switch(r.prev=r.next){case 0:return h(!1),r.prev=1,r.next=4,b({id:e,password:a});case 4:if(!(s=r.sent).error){r.next=11;break}return(0,N.t6)({message:t("error.password_too_many_attempts"),type:"error"}),c("error.password_too_many_attempts"),I(!1),h(!0),r.abrupt("return",!1);case 11:if(i=null===s||void 0===s||null===(n=s.data)||void 0===n?void 0:n.checkReviewPassword.accessToken){r.next=16;break}return h(!0),I(!1),r.abrupt("return",!1);case 16:return I(!0),(0,_.G_)(e,i),r.abrupt("return",window.location.href=(0,v.o)({reviewId:e}));case 21:r.prev=21,r.t0=r.catch(1);case 23:case"end":return r.stop()}}),r,null,[[1,21]])})));return function(){return r.apply(this,arguments)}}();return{passphraseIsIncorrect:f,isAuthenticating:w,checkPassphrase:k}}(U,t),z=L.checkPassphrase,M=L.isAuthenticating,B=L.passphraseIsIncorrect,G=(0,u.$G)().t,Q=(0,p.T)(),K=(0,d.s0)(),D=S?"":null===R||void 0===R?void 0:R.logo,H=S?"":null===R||void 0===R?void 0:R.name,Y=(null===O||void 0===O?void 0:O.title)||G("review.untitled");return(0,l.useEffect)((function(){if(O&&U&&(!O.passwordProtected||(0,_.BV)(U)))return K((0,v.o)({reviewId:U}))}),[K,O,U]),(0,l.useEffect)((function(){if(O&&U&&O.passwordProtected&&$&&(0,_.e5)($.publicId))return K((0,v.o)({reviewId:U}))}),[K,$,O,U]),(0,l.useEffect)((function(){(0,n.Z)(o().mark((function e(){return o().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(null===O||void 0===O||!O.teamId||O.teamId===(null===R||void 0===R?void 0:R.id)){e.next=3;break}return e.next=3,Q((0,f.F)(O.teamId));case 3:k(!1);case 4:case"end":return e.stop()}}),e)})))()}),[null===R||void 0===R?void 0:R.id,Q,null===O||void 0===O?void 0:O.teamId]),(0,l.useEffect)((function(){E(B?"error":void 0)}),[B,t]),F||!O||O.reviewCollectionId&&(q||!$)?null:(0,T.jsx)(m.W,{passphrase:t,onChange:r,isAuthenticating:M,isLoading:F||b,ownerName:H,avatarUrl:D,title:Y,status:A,onSubmit:z})}},66893:function(e,a,t){function r(e){var a=e.reviewId;return"/reviews/".concat(a)}t.d(a,{o:function(){return r}})},36106:function(e,a,t){t.d(a,{F:function(){return l}});var r=t(15861),n=t(64687),s=t.n(n),i=t(87498),o=t(51526),l=function(e){return function(){var a=(0,r.Z)(s().mark((function a(t){var r,n;return s().wrap((function(a){for(;;)switch(a.prev=a.next){case 0:return a.next=2,i.kV.get("/public/teams/".concat(e));case 2:r=a.sent,n=r.body.team,t((0,o.Vk)(n));case 5:case"end":return a.stop()}}),a)})));return function(e){return a.apply(this,arguments)}}()}}}]);