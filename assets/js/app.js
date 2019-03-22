// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import _ from 'lodash';
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";
import tasktracker_init from "./components/tasktracker";
import store from './store';
import api from './api';

$(function() {
  api.request_tasks();
  api.request_users();
  tasktracker_init(store)
});
