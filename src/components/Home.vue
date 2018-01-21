<template>
  <div id="home">
  <div class="spacer">
  <div class="box middle thin" v-for="group in groups" v-bind:key="group.id">
      <h1 class="title">
        {{group.name}}
      </h1>
      <table class="table is-fullwidth">
        <thead>
          <tr>
            <th><abbr title="Position">Name</abbr></th>
            <th style="text-align: right">Balance</th>
          </tr>
        </thead>
      <tbody>
          <tr v-for="member in group.members" v-bind:key="member.name">
            <td>{{member.name}}</td>
            <td style="text-align: right">{{member.balance}}</td>
          </tr>
      </tbody>
      </table>
      <hr>
      <a class="button is-black is-outlined" v-on:click="login()"><b-icon
          icon="receipt"
          size="is-medium">
      </b-icon></a>
      <a class="button is-success is-outlined" v-on:click="login()"><b-icon
          icon="refresh"
          size="is-medium">
      </b-icon></a>
    </div>
  </div>
  </div>
</template>

<script>
import API from './api.js'

export default {
  name: 'Home',
  data () {
    return {
      groups: []
    }
  },
  methods: {
    groupInfo: function () {
      // First reach out and get all the group ids
      // we don't want to fetch them all at the same
      // time
      this.$http.get(API + '/api/v1/user').then(response => {
        // Now that we have done this, load up 5 or less of their groups
        var leng = Math.min(5, response.body.groups.length)
        console.log(this.groupids)
        for (var i = 0; i < leng; i++) {
          this.$http.get(API + '/api/v1/group/' + response.body.groups[i]).then(response => {
            this.groups.push(response.body)
          })
        }
      }, response => {
        this.$toast.open({
          message: 'Please login to view your groups!',
          position: 'is-bottom',
          duration: 5000})
      })
    }
  },
  created () {
    this.groupInfo()
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.thin {
  position: relative;
}
.spacer {
  text-align: center;
  margin: 0 auto;
  max-width: 400px;
  padding-top: 20px;
}
</style>
