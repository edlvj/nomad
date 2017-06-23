/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
/******/ })
/************************************************************************/
/******/ ({

/***/ 2:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony default export */ __webpack_exports__["default"] = ({
  state: {
    results: [],
    result: [],
    user: [],
    topic: []
  },
  getters: {
    cities: function cities(state) {
      return state.results;
    },
    city: function city(state) {
      return state.result;
    },
    user: function user(state) {
      return state.user;
    },
    topic: function topic(state) {
      return state.topic;
    }
  },
  mutations: {
    set: function set(state, _ref) {
      var type = _ref.type,
          items = _ref.items;

      state[type] = items;
    }
  },
  actions: {
    all: function all(_ref2, context) {
      var commit = _ref2.commit;

      context.$http.get('cities').then(function (response) {
        commit('set', { type: 'results', items: response.data });
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    search: function search(_ref3, context) {
      var commit = _ref3.commit;

      context.$http.get('cities?search=' + context.query).then(function (response) {
        commit('set', { type: 'results', items: response.data });
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    getCity: function getCity(_ref4, context) {
      var commit = _ref4.commit;

      context.$http.get('cities/' + context.id).then(function (response) {
        commit('set', { type: 'result', items: response.data });
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    login_social: function login_social(_ref5, context) {
      var commit = _ref5.commit;

      context.$http.get('custom/' + context.provider + '/callback?code=' + context.code).then(function (response) {
        console.log(response);
        localStorage.setItem('access_token', JSON.stringify(response.data));
        localStorage.setItem('user_id', JSON.stringify(response.data.id));
        context.$router.push('/');
      });
    },
    logout: function logout(_ref6, context) {
      var commit = _ref6.commit;

      context.$http.delete('auth/sign_out').then(function (response) {
        localStorage.removeItem('access_token');
      });
    },
    getUser: function getUser(_ref7, context) {
      var commit = _ref7.commit;

      context.$http.get('users/' + context.id).then(function (response) {
        commit('set', { type: 'user', items: response.data });
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    setFavorite: function setFavorite(_ref8, context) {
      var commit = _ref8.commit;

      var fave_params = { city_id: context.id, visited: context.visited };
      context.$http.post('favorites', { favorite: fave_params }).then(function (response) {
        context.$dialog("Added to Favorites");
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    saveTopic: function saveTopic(_ref9, context) {
      var commit = _ref9.commit;

      context.$http.post('topics', context.topic).then(function (response) {
        context.$dialog("topic created");
        context.$router.push('/topic/' + response.data.id);
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    getTopic: function getTopic(_ref10, context) {
      var commit = _ref10.commit;

      context.$http.get('topics/' + context.id).then(function (response) {
        commit('set', { type: 'topic', items: response.data });
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    saveComment: function saveComment(_ref11, context) {
      var commit = _ref11.commit;

      var comment_params = { text: context.text, topic_id: context.topic_id };
      context.$http.post('comments', { comment: comment_params }).then(function (response) {
        context.$dialog("comment created");
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    },
    setRate: function setRate(_ref12, context) {
      var commit = _ref12.commit;

      var rating_params = { city_id: context.city_id, rate: context.rating, rate_type: context.rate_type };
      context.$http.post('ratings', { rating: rating_params }).then(function (response) {
        context.$dialog("thx for rate");
      }, function (response) {
        context.$dialog("Something went wrong");
      });
    }
  }
});

/***/ })

/******/ });