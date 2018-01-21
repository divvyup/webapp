<template>
  <div id="login" style="height: 100%;">
    <section class="thinmessage">
      <b-message title="Note!" type="is-danger" :active.sync="isActive">
        Signup is disabled at this time. Please see the <a href="#/login">login</a> page for more information.
      </b-message>
    </section>
    <h1><strong>Create your account :)</strong><hr class="centered"></h1>
    <section style="height: 100% !important;">
      <b-field label="Username" class="centered">
          <b-input v-model="username" value="me" maxlength="30"></b-input>
      </b-field>

      <b-field label="Password" class="centered">
          <b-input v-model="password" value="123" type="password" maxlength="30"></b-input>
      </b-field>

      <b-field label="Password Confirm" class="centered">
          <b-input v-model="password" value="123" type="password" maxlength="30"></b-input>
      </b-field>
    </section>
    <a class="button is-info is-outlined" v-on:click="register()">Register!</a>
  </div>
</template>

<script>
import API from './api.js'
export default {
  name: 'Home',
  data () {
    return {
      username: '',
      password: '',
      isActive: true
    }
  },
  methods: {
    register: function () {
      this.$http.post(API + '/api/v1/auth/register', {
        username: this.username,
        password: this.password
      }).then(response => {
        this.$parent.getUser()
        this.$router.push('/')
      }, response => {
        this.$toast.open({
          message: response.body.message || 'There was a problem creating your account.',
          position: 'is-bottom',
          duration: 5000})
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1 {
  font-size: 130%;
  padding-bottom: 15px;
}
html,body,div {
  background-color: #f0f0f0 !important;
}
.centered {
  margin: 0 auto;
  text-align: center;
  width: 80%;
  max-width: 250px;
}
.thinmessage {
  padding-top: 20px;
  margin: 0 auto;
  text-align: left;
  width: 80%;
  max-width: 250px;
}
</style>
