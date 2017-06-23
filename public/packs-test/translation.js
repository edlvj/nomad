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
/******/ 	return __webpack_require__(__webpack_require__.s = 3);
/******/ })
/************************************************************************/
/******/ ({

/***/ 3:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony default export */ __webpack_exports__["default"] = ({
  ua: {
    user: {
      fb_login: 'Увійти через Facebook',
      profile: 'Профіль',
      exit: 'Вихід',
      visit: 'Відвідав',
      want_visit: 'Хоче відвідати'
    },
    message: {
      title: 'Nomad',
      rating: 'Рейтиги',
      traveler: 'Путівник',
      prices: 'Ціни',
      forum: 'Форум',
      city: 'Місто',
      type: 'Тип'
    },
    tabs: {
      rating: {
        quality_life: 'Якість життя',
        fun: 'Розваги',
        safe: 'Безпека',
        toward: 'Відношення до іноземців'
      },
      traveler: {
        region: 'Регіон',
        country: 'Країна',
        couchsurf: 'Коучсерфинг (Кіскість Хостів)',
        insurance: 'Страховка для подорожуючих'
      },
      price: {
        airbnb: 'Airbnb квартира (средня ціна)',
        meal: 'Базове харчування (в ресторані)',
        fin_req: 'Ціна на день (перебування)'
      },
      forum: {
        no_topic: 'Немає тем'
      }
    },
    cities: {
      show: 'Переглянути'
    },
    city: {
      want_visit: 'Хочу відвідати',
      visited: 'Вже відвідав'
    },
    region: {
      Europe: 'Европа',
      America: 'Америка',
      Asia: 'Азія'
    },
    topic: {
      add: 'Створити тему',
      title: 'Заголовок',
      text: 'Текст',
      city: 'Місто',
      choose_city: 'Оберіть місто',
      create: 'Створити'
    },
    comment: {
      comment: 'Комментар',
      add: 'Додати'
    }
  },

  en: {
    user: {
      fb_login: 'Enter with facebook',
      profile: 'Profile',
      exit: 'Exit',
      visit: 'Visit',
      want_visit: 'Want Visit'
    },
    message: {
      title: 'Nomad',
      rating: 'Rating',
      traveler: 'Traveler',
      prices: 'Prices',
      forum: 'Forum'
    },
    tabs: {
      rating: {
        quality_life: 'Quality of life',
        fun: 'Fun',
        safe: 'Safe',
        toward: 'Toward to forgeins'
      },
      traveler: {
        region: 'Region',
        country: 'Country',
        couchsurf: 'couchsurf (count hosts)',
        insurance: 'Insurance'
      },
      price: {
        airbnb: 'Airbnb appaetament ',
        meal: 'Basic Meal (in restorans)',
        fin_req: 'Price on a day'
      },
      forum: {
        no_topic: 'No topics'
      }
    },
    cities: {
      show: 'Show'
    },
    city: {
      want_visit: 'Want to visit',
      visited: 'Already visited'
    },
    region: {
      Europe: 'Europe',
      America: 'America',
      Asia: 'Asia'
    },
    topic: {
      add_topic: 'Create Topic',
      title: 'Title',
      text: 'Text',
      choose_city: 'Choose city',
      city: 'City',
      create: 'Create'
    },
    comment: {
      comment: 'Comment',
      add: 'Add'
    }
  }
});

/***/ })

/******/ });