<<<<<<< d01b303b692c08116b405fb00bfabc69961ce635
=======
// var inputFields = new Vue({
//   el: '#inputFields',
//   data: {
//     title: '',
//     author: '',
//     body: ''
//   }
// });


>>>>>>> started working on new tag submit
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
        // console.log(that.tags)
      }
    })
  },
  methods: {
    addTag: function () {
<<<<<<< d01b303b692c08116b405fb00bfabc69961ce635
      this.checkedTags.push('');
    },
    deleteTagField: function (checkedTag) {
      this.checkedTags.$remove(checkedTag)
=======
      this.checkedTags.push({ 
        tag_name: '' 
      });
      console.log(this.checkedTags)
>>>>>>> started working on new tag submit
    }
  }
});

<<<<<<< d01b303b692c08116b405fb00bfabc69961ce635
=======

>>>>>>> started working on new tag submit
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
<<<<<<< d01b303b692c08116b405fb00bfabc69961ce635
=======
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
>>>>>>> started working on new tag submit
});