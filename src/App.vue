<template>
  <div id="app">
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item homepage" href="http://divvyup.doms.land">
         divvyup
        </a>
        <button id="burger" class="button navbar-burger" v-on:click="toggleBurger">
          <span></span>
          <span></span>
          <span></span>
        </button>
      </div>
      <div id="nav-menu" class="navbar-right navbar-menu">
        <a class="navbar-item" href="#/" v-on:click="autoclose">Home</a>
        <a class="navbar-item" href="#/login" v-on:click="autoclose">Login</a>
        <a class="navbar-item" href="#/signup" v-on:click="autoclose">Signup</a>
        <span class="is-divider"></span>
        <div class="navbar-end">
        <a class="navbar-item" href="#/settings" v-on:click="autoclose">
          {{username}}
        </a>
      </div>
      </div>
    </nav>
    <router-view/>
  </div>
</template>

<script>
import API from './components/api.js'
export default {
  name: 'App',
  data () {
    return {
      username: '',
      groups: []
    }
  },
  methods: {
    autoclose: function () {
      let dropMenu = document.getElementById('nav-menu')
      if (dropMenu.classList.contains('is-active')) {
        this.toggleBurger()
      }
    },
    toggleBurger: function (params) {
      let burgerIcon = document.getElementById('burger')
      let dropMenu = document.getElementById('nav-menu')
      burgerIcon.classList.toggle('is-active')
      dropMenu.classList.toggle('is-active')
    },
    getUser: function () {
      this.$http.get(API + '/api/v1/user').then(response => {
        this.username = response.body.name + '\'s account'
        this.groups = response.body.groups
      })
    },
    getGroups: function () {
      return this.groups
    }
  },
  mounted () {
    this.getUser()
  }
}
</script>

<style>
@font-face {
  font-family: DeliciousRoman;
  src: url('./assets/Delicious-Roman.otf');
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
html, body {
  background-color: #f0f0f0;
  margin: 0;
  height: 100%;
}
.homepage {
  font-family: DeliciousRoman, Helvetica, Arial, sans-serif;
  background-color: #fbb917;
}
</style>
