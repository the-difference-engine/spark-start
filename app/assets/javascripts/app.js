var tags = new Vue({
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
      url: '/category.json',
      success: function(res) {
        that.categories = res;
      }
    })
  }
});