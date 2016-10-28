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