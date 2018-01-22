<template>
  <div id="group">
    <div class="spacer">
      <b-message type="is-success" has-icon>
        The following image was processed using the google vision API to create the
        list of items and prices you see below it! <strong>This can be done automatically for you too!</strong>
        Simply snap a picture of your receipt and we'll (with a little help from google)
        handle the rest.
      </b-message>
      <img src="../assets/example.png">
      <div class="box middle thin" v-for="receipt in receipts" v-bind:key="receipt.id">
        <h1 class="title">
            01/18/2018
          </h1>
          <table class="table is-fullwidth">
            <thead>
              <tr>
                <th><abbr title="Position">Item</abbr></th>
                <th style="text-align: right">Price</th>
              </tr>
            </thead>
          <tbody>
              <tr v-for="item in receipt.items" v-bind:key="item.name">
                <td>{{item.name}}</td>
                <td style="text-align: right">${{item.price}}</td>
              </tr>
          </tbody>
        </table>
    </div>
    </div>
  </div>
</template>

<script>
import API from './api.js'
export default {
  name: 'Login',
  data () {
    return {
      receipts: [],
      id: 0
    }
  },
  methods: {
    getReceipts: function () {
      this.$http.get(API + '/api/v1/group/' + this.$route.params.id + '/receipts').then(response => {
        var num = Math.min(5, response.body.receipts.length)
        for (var i = 0; i < num; i++) {
          this.$http.get(API + '/api/v1/receipt/' + response.body.receipts[i]).then(response => {
            this.receipts.push(response.body)
          })
        }
      })
    }
  },
  created () {
    this.id = this.$route.params.id
    this.getReceipts()
  }
}
</script>

<style scoped>
.spacer {
  text-align: center;
  margin: 0 auto;
  max-width: 400px;
  padding-top: 20px;
  width: 95%;
}
</style>
