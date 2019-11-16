/* eslint no-console:0 */

// アプリケーション全体で使う用
// * モーダルなど共通で使用するようなJS類
// * スタイルシートや画像などはここを起点に読み込み

import '../javascripts/application';
import '../stylesheets/application';

import Vue from 'vue';
import Home from '../components/home/Home';

import store from '../store';

document.addEventListener('DOMContentLoaded', () => {
    if ($('#home-vue').length > 0) {
        new Vue({
            el: "#home-vue",
            store,
            render: h => h(Home)
        });
    }
});
