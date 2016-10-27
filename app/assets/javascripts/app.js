// var inputFields = new Vue({
//   el: '#inputFields',
//   data: {
//     title: '',
//     author: '',
//     body: ''
//   }
// });


var tags =  new Vue({
  el: '#tags',
  data: {
    show: false,
    tags: [],
    checkedTags: []
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
  methods: {
    addTag: function () {
      this.checkedTags.push('');
    },
    deleteTagField: function (checkedTag) {
      this.checkedTags.$remove(checkedTag)
    }
  }
});


var categories = new Vue ({
  el: '#categories',
  data: {
    show: false,
    categories: [],
    checkedCategories: []
  },
  ready: function() {
    var that;
    that = this;
    $.ajax({
      url: '/categories.json',
      success: function(res) {
        that.categories = res;
      }
    })
  },
  methods: {
    addCategory: function () {
      this.checkedCategories.push('');
    },
    deleteCategoryField: function (checkedCategory) {
      this.checkedCategories.$remove(checkedCategory)
    }
  }
});


var tagsCategories = new Vue({
  el: '#tagsCategories',
  data: {
    title: '',
    author: '',
    body: '',
    tags: [],
    checkedTags: [],
    categories: [],
    checkedCategories: []
  },
  methods: {
    // postTags: function(){
    //   var that = this;
    //   $.ajax({
    //     method: 'POST',
    //     data: {
    //       checkedTags: that.checkedTags
    //     },
    //     url: '/tags.json',
    //     success: function(res) {
    //       that.errors = {};
    //       that.checkedTags.push(res);
    //     }
    //   })
    // },
    // postCategories: function(){
    //   var that = this;
    //   $.ajax({
    //     method: 'POST',
    //     data: {
    //       checkedCategories: that.checkedCategories
    //     },
    //     url: '/categories.json',
    //     success: function(res) {
    //       that.errors = {};
    //       that.checkedCategories.push(res);
    //     }
    //   })
    // },
    // postFields: function(){
    //   var that = this;
    //   $.ajax({
    //     method: 'POST',
    //     data: {
    //       title: that.title,
    //       author: that.author,
    //       body: that.body
    //     },
    //     url: '/post.json',
    //     success: function(res) {
    //       that.errors = {};
    //       that.title.push(res);
    //       that.author.push(res);
    //       that.body.push(res);
    //     }
    //   })
    // },
    // handler: function(){
    //   this.postCategories;
    //   this.postTags;
    //   this.postFields;
    // }
  }
});