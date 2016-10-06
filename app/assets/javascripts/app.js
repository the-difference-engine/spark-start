var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})

new Vue ({
  el: '#checkbox',
  data: {
    checkedNames: []
  }
})

// new Vue ({
//   el: '#tags',
//   data: {
//     // tag: { tag_name: ''},
//     tags: [    
//     {"tag_name": "ruby"},
//     {"tag_name": "js"},
//     {"tag_name": "blue"}
//     ]
//   }
// })

new Vue ({
  el: '#tags',
  ready: function() {
    debugger
    this.fetchTags()
  },
  methods: {
    fetchTags: function() {
      console.log("tetjetetta")
      var tags = []
    },
    this.$http.get('/tags').success(function(tags) {
      this.$set('tags', tags);
    }).error(function(error) {
      console.log(error);
    });
      }
    }
})