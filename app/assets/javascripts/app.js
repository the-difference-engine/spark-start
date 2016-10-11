var inputFields = new Vue({
  el: '#inputFields',
  data: {
    title: '',
    author: '',
    body: ''
  }
  // methods: {
  //   postData: function(){
  //     var that = this;
  //     $.ajax({
  //       method: 'POST',
  //       data: {
  //         title: that.title,
  //         author: that.author,
  //         body: that.body
  //       }
  //       url: '/posts.json',
  //       success: function(res) {
  //         that.posts = res;
  //       }
  //     })
  //   }
  // }
});

var tagsCategories = new Vue({
  el: '#tagsCategories',
  data: {
    show: false,
    show2: false,
    tags: [],
    checkedTags: [],
    categories: [],
    checkedCategories: []
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
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/category.json',
      success: function(res) {
        that.categories = res;
      }
    })
  },
  methods: {
    postTags: function(){
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          checkedTags: that.checkedTags
        },
        url: '/tags.json',
        success: function(res) {
          that.errors = {};
          that.checkedTags.push(res);
        }
      })
    },
    postCategories: function(){
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          checkedCategories: that.checkedCategories
        },
        url: '/category.json',
        success: function(res) {
          that.errors = {};
          that.checkedCategories.push(res);
        }
      })
    }
  }
});

Vue.component('toggle', function(){
  template: '#toggleButton',
  // methods: {
  //   toggleOn: function(){
  //     show != show
  //   }
  // }
})

// var categories = new Vue ({
//   el: '#categories',
//   data: {
//     show: false,
//     categories: [],
//     checkedCategories: []
//   },
//   ready: function() {
//     var that;
//     that = this;
//     $.ajax({
//       url: '/category.json',
//       success: function(res) {
//         that.categories = res;
//       }
//     })
//   }
//   methods: {
//     postCategories: function(){
//       var that = this;
//       $.ajax({
//         method: 'POST',
//         data: {
//           checkedCategories: that.checkedCategories
//         },
//         url: '/category.json',
//         success: function(res) {
//           that.errors = {};
//           that.checkedCategories.push(res);
//         }
//       })
//     }
//   }
// });

// Vue.component ('child-component', function(){
//   props: ['tags', 'categories']
// });

