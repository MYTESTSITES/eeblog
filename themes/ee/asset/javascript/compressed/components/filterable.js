"use strict";function _typeof(e){return(_typeof="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e})(e)}function _extends(){return _extends=Object.assign||function(e){for(var t=1;t<arguments.length;t++){var i=arguments[t];for(var n in i)Object.prototype.hasOwnProperty.call(i,n)&&(e[n]=i[n])}return e},_extends.apply(this,arguments)}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function _defineProperties(e,t){for(var i=0;i<t.length;i++){var n=t[i];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(e,n.key,n)}}function _createClass(e,t,i){return t&&_defineProperties(e.prototype,t),i&&_defineProperties(e,i),e}function _possibleConstructorReturn(e,t){return!t||"object"!==_typeof(t)&&"function"!=typeof t?_assertThisInitialized(e):t}function _getPrototypeOf(e){return(_getPrototypeOf=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)})(e)}function _inherits(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&_setPrototypeOf(e,t)}function _setPrototypeOf(e,t){return(_setPrototypeOf=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e})(e,t)}function _assertThisInitialized(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}function _defineProperty(e,t,i){return t in e?Object.defineProperty(e,t,{value:i,enumerable:!0,configurable:!0,writable:!0}):e[t]=i,e}/*!
 * This source file is part of the open source project
 * ExpressionEngine (https://expressionengine.com)
 *
 * @link      https://expressionengine.com/
 * @copyright Copyright (c) 2003-2019, EllisLab Corp. (https://ellislab.com)
 * @license   https://expressionengine.com/license Licensed under Apache License, Version 2.0
 */
function makeFilterableComponent(e){return function(t){function i(e){var t;return _classCallCheck(this,i),t=_possibleConstructorReturn(this,_getPrototypeOf(i).call(this,e)),_defineProperty(_assertThisInitialized(_assertThisInitialized(t)),"itemsChanged",function(e){t.setState({items:e})}),_defineProperty(_assertThisInitialized(_assertThisInitialized(t)),"initialItemsChanged",function(e){t.initialItems=e,!t.ajaxFilter&&t.state.filterValues.search&&(e=t.filterItems(e,t.state.filterValues.search)),t.setState({items:e}),t.props.itemsChanged&&t.props.itemsChanged(e)}),_defineProperty(_assertThisInitialized(_assertThisInitialized(t)),"filterChange",function(e,i){var n=t.state.filterValues;if(n[e]=i,t.setState({filterValues:n}),!t.ajaxFilter&&"search"==e)return void t.itemsChanged(t.filterItems(t.initialItems,i));clearTimeout(t.ajaxTimer),t.ajaxRequest&&t.ajaxRequest.abort();var r=n;r.selected=t.getSelectedValues(t.props.selected),t.setState({loading:!0}),t.ajaxTimer=setTimeout(function(){t.ajaxRequest=t.forceAjaxRefresh(r)},300)}),t.initialItems=SelectList.formatItems(e.items),t.state={items:t.initialItems,initialCount:t.initialItems.length,filterValues:{},loading:!1},t.ajaxFilter=SelectList.countItems(t.initialItems)>=e.limit&&e.filterUrl,t.ajaxTimer=null,t.ajaxRequest=null,t}return _inherits(i,t),_createClass(i,[{key:"filterItems",value:function(e,t){var i=this;return e=e.map(function(e){e=Object.assign({},e),e.children&&(e.children=i.filterItems(e.children,t));var n=e.children&&e.children.length>0,r=String(e.label).toLowerCase().includes(t.toLowerCase());return!(!r&&!n)&&e}),e.filter(function(e){return e})}},{key:"getSelectedValues",value:function(e){var t=[];return e instanceof Array?t=e.map(function(e){return e.value}):e.value&&(t=[e.value]),t.join("|")}},{key:"forceAjaxRefresh",value:function(e){var t=this;return e||(e=this.state.filterValues,e.selected=this.getSelectedValues(this.props.selected)),$.ajax({url:this.props.filterUrl,data:$.param(e),dataType:"json",success:function(e){t.setState({loading:!1}),t.initialItemsChanged(SelectList.formatItems(e))},error:function(){}})}},{key:"render",value:function(){var t=this;return React.createElement(e,_extends({},this.props,{loading:this.state.loading,filterChange:function(e,i){return t.filterChange(e,i)},initialItems:this.initialItems,initialCount:this.state.initialCount,items:this.state.items,itemsChanged:this.initialItemsChanged}))}}]),i}(React.Component)}