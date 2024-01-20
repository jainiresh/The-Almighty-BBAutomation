"use strict";(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[3982],{42108:function(e,t,r){r.r(t),r.d(t,{PaymentPendingPage:function(){return L},default:function(){return X}});var n=r(13706),i=r(98788),o=r(90581),a=r(27805),u=r(47842),s=r(21218),c=r(88673),p=r(94776),l=r.n(p),d=r(52322),v=r(13980),f=r.n(v),g=r(2784),h=r(17635),m=r(91504),_=r(55301),y=r(5026),Z=r(43853),k=r(23307),b=r(61335),w=r(70813),S=r(33197),P=r(45941),x=r(14334),C=r(73293),N=r(47730),T=r(8870),A=r(72164),E=r(7173),q=function(e){(0,E.Qc)().push(["track","purchase",e])},j=r(83043),D=r(90991),L=function(e){(0,s.Z)(r,e);var t=(0,c.Z)(r);function r(){var e;(0,o.Z)(this,r),e=t.apply(this,arguments),(0,u.Z)((0,n.Z)(e),"state",{polling:null,pollingCounter:0});var a=(0,n.Z)(e);(0,u.Z)((0,n.Z)(e),"getCheckout",(0,i.Z)(l().mark((function e(){return l().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,a.props.getCheckoutDetails(a.props.account.subscription.id);case 2:case"end":return e.stop()}}),e)})))),(0,u.Z)((0,n.Z)(e),"startPolling",(function(){var t=e.props.route.query;if(e.props.setPending("pollingSubscription"),t&&t.client_secret&&t.source)return e.retrieveStripeSource();e.pollSubscription()}));var s=(0,n.Z)(e);(0,u.Z)((0,n.Z)(e),"retrieveStripeSource",(0,i.Z)(l().mark((function e(){var t,r,n;return l().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t=s.props.route.query,e.prev=1,e.next=4,s.loadStripe();case 4:return r=e.sent,e.next=7,r.retrieveSource({id:t.source,client_secret:t.client_secret});case 7:if(!(n=e.sent.source)||!m.X.payment.chargeableStatus.includes(n.status)){e.next=10;break}return e.abrupt("return",s.pollSubscription());case 10:s.redirectAfterError("payment_cancelled"),e.next=16;break;case 13:e.prev=13,e.t0=e.catch(1),s.redirectAfterError("source_retrieve_error");case 16:case"end":return e.stop()}}),e,null,[[1,13]])}))));var c=(0,n.Z)(e);return(0,u.Z)((0,n.Z)(e),"pollSubscription",(0,i.Z)(l().mark((function e(){var t,r,n,i;return l().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return t=c.state.pollingCounter,r=c.props.account,n=r.id,i=r.subscription,e.next=4,c.props.getSubscription(n,i.id);case 4:if(!(S.V2.includes(i.status)&&t>0)){e.next=6;break}return e.abrupt("return",c.redirectAfterPayment());case 6:if(!(t<=26)){e.next=8;break}return e.abrupt("return",c.setState({pollingCounter:t+1,polling:setTimeout(c.pollSubscription,2e3)}));case 8:y.Z.track("PaymentPendingPollingLimitHit",{nu_subscription_id:i.id}),c.redirectAfterError("activate_subscription_exception");case 10:case"end":return e.stop()}}),e)})))),(0,u.Z)((0,n.Z)(e),"resetPolling",(function(){clearTimeout(e.state.polling),e.setState({polling:null,pollingCounter:0}),e.props.resetPending("pollingSubscription")})),e}return(0,a.Z)(r,[{key:"componentDidMount",value:function(){this.startPolling(),this.getCheckout()}},{key:"componentWillUnmount",value:function(){this.resetPolling()}},{key:"loadStripe",value:function(){var e=this;return(0,i.Z)(l().mark((function t(){return l().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.prev=0,t.next=3,(0,P.Z)(m.X.stripe.url);case 3:return t.abrupt("return",window.Stripe(m.X.stripe.publishableKey,{apiVersion:m.X.stripe.apiVersion}));case 6:t.prev=6,t.t0=t.catch(0),y.Z.track(t.t0),e.redirectAfterError("something_went_wrong");case 10:case"end":return t.stop()}}),t,null,[[0,6]])})))()}},{key:"redirectAfterPayment",value:function(){var e,t,r,n,i,o,a=this.props,u=a.account,s=u.subscription,c=u.checkout,p=a.user,l=a.route;if(l.query.renewal)return j.Z.navigateTo("/account",!1,{search:"duration=".concat(s.plan.interval,"&renewal=true")});if(l.query.update)return j.Z.navigateTo("/workspace/payment"),void this.props.setNotification("notification","update_payment_success");var d,v,f=(null===(e=s.plan)||void 0===e?void 0:e.interval)||"",g=(null===(t=c.order)||void 0===t?void 0:t.total)||0;c.order&&!c.order.coupon_code&&("on"===(0,T.hl)(w.vE)&&C.Z.trackSnowplowEvent({category:"transfer",action:"sign_up-referral",label:"referral_".concat(s.unique_id)}),q({id:s.unique_id,amount:c.order.total_excluding_discount,currency:null===(d=c.order.currency)||void 0===d?void 0:d.toUpperCase(),customer:{email:p.email,id:p.id.toString(),firstName:p.given_name,lastName:p.family_name},products:[{price:c.order.total,quantity:s.quantity,sku:null===(v=c.order.plan_id)||void 0===v?void 0:v.toString()}]}));if(N.bF({userId:p.id,tier:p.planTier,interval:f,value:g,currency:null===(r=c.order)||void 0===r?void 0:r.currency.toUpperCase(),transaction_id:s.unique_id,coupon:null===c||void 0===c||null===(n=c.order)||void 0===n?void 0:n.coupon_code,tax:null===(i=c.order)||void 0===i?void 0:i.tax,discount:null===c||void 0===c||null===(o=c.order)||void 0===o?void 0:o.discount}),this.props.route.query.skip||function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];try{(0,Z.T)()?window.dispatchEvent(new CustomEvent(_.AdSDKListeners.ROTATE_WALLPAPER)):window.AdTech.wallpaper.actions.rotate({force:e})}catch(t){y.Z.track(t)}}(),p.isVerified&&!p.preferences.onboarded)return j.Z.navigateTo("/payment/completed");j.Z.navigateTo("/")}},{key:"redirectAfterError",value:function(e){var t,r=this.props,n=r.account.checkout,i=r.user,o=r.route,a=(null===n||void 0===n||null===(t=n.order)||void 0===t?void 0:t.total)||0;if(o.query.update)return N.WN(a,e),j.Z.navigateTo("/payment/update"),void this.props.setNotification("error",e);N.Y4(a,e),(0,x.dM)(i)&&j.Z.navigateTo("/payment/methods"),this.props.setNotification("error",e)}},{key:"makeTitle",value:function(){var e=this.props.route.query;return e.update?A.Z.t("page.payment_update.update_in_progress"):e.skip?A.Z.t("page.payment_pending.order_in_progress"):A.Z.t("page.payment_methods.payment_in_progress")}},{key:"render",value:function(){return(0,d.jsxs)("div",{className:"payment-methods__progress-wrapper",children:[(0,d.jsx)("div",{className:"payment-methods__loader",children:(0,d.jsx)(k.Z,{pulseEnabled:!1,backgroundColor:"transparent",innerCircleColor:b.Cj})}),(0,d.jsx)("h1",{className:"payment-methods__progress-title",children:this.makeTitle()}),(0,d.jsx)("h3",{className:"payment-methods__progress-subtitle",children:A.Z.t("page.payment_methods.do_not_refresh")})]})}}]),r}(g.Component);L.propTypes={account:f().object,getSubscription:f().func,getCheckoutDetails:f().func,pending:f().object,resetPending:f().func,route:f().object,setNotification:f().func,setPending:f().func,user:f().object};var V={getSubscription:D.Z.Account.getSubscription,getCheckoutDetails:D.Z.Account.getCheckoutDetails,resetPending:D.Z.Pending.resetPending,setNotification:D.Z.Notification.setNotification,setPending:D.Z.Pending.setPending},X=(0,h.$j)((function(e){return{account:e.account,pending:e.pending,route:e.route,user:e.user}}),V)(L)}}]);