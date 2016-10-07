var tags = new Vue({
  el: '#tags',
  data: {
    show: false,
    tags: [],
    checkedTags: [],
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/tags.json',
      success: function(res) {
        that.tags = res;
      }
    })
  }
});

// new Vue ({
//   el: '#showTags',
//   data: {
//     active: false,
//     message: 'it works'
//   }
//   methods: {
//     toggle: function() {
//       this.active = !this.active;
//     }
//   }
// })