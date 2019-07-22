import Vue from 'vue';

export const sharedMethods = new Vue ({
  methods: {
    formatedDate(date) {
      let year = date.getFullYear()
      let month = this.formatedInfo(date.getMonth() + 1)
      let day = this.formatedInfo(date.getDate())
      return `${year}-${month}-${day}`
    },
    formatedInfo(number) {
      if (number.toString().length > 1) {
        return number
      } else {
        return `0${number}`
      }
    }
  }
});