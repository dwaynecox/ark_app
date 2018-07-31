/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      arks: [],
      currentArk: {}
    };
  },
  created: function() {
    axios.get("/api/arks").then(function(response){
      this.arks = response.data;
      console.log(this.arks);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      image: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        image: this.image,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        admin: false
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          localStorage.setItem("user_id", response.data.user.id);
          location.reload();
          // this.errors = "Thank you for successfully logging in!"
          router.push("/users/"+response.data.user.id);
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("user_id");
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var ArksIndexPage = {
  template: "#arks-index-page",
  data: function() {
    return {
      arks: [],
      currentArk: {},
      user: {}
    };
  },
  created: function() {
    axios.get("/api/arks").then(function(response){
      this.arks = response.data;
      console.log(this.arks);
    }.bind(this));
  },
  methods: {
      setCurrentArk: function(ark) {
        this.currentArk = ark;
        console.log(this.currentArk);
        router.push("/arks/" + this.currentArk.id)
        }
      },
    computed: {}
  };

  var ArksShowPage = {
    template: "#arks-show-page",
    data: function() {
      return {
        ark: {},
        user: {}
      };
    },
    created: function() {
      axios.get("/api/arks/" + this.$route.params.id).then(function(response){
        this.ark = response.data;
        console.log(this.ark);
      }.bind(this));
    },
    methods: {
      getUserId: function() {
            return localStorage.getItem("user_id");
          }
    },
    computed: {}
  };

  var ArksEditPage = {
    template: "#arks-edit-page",
    data: function() {
      return {
      currentArk: {},
      description: "",
      user_id: "",
      image: "",
      location: "",
      dollar_id: "",
      created_by: "",
      errors: []
      };
    },
    created: function() {
      axios.get("/api/arks/" + this.$route.params.id).then(function(response){
       
        this.description = response.data.description;
        this.image = response.data.image;
        this.location = response.data.location;
        console.log(this.user);
      }.bind(this));
    },
    methods: {
      submit: function() {
        var params = {
          description: this.description,
          image: this.image,
          location: this.location
        };
        axios
          .patch("/api/arks/" + this.$route.params.id, params)
          .then(function(response) {
            router.push("/arks/" + this.$route.params.id);
            console.log(this.ark);
          }.bind(this))
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          );
      }
    }
  };

var ArksNewPage = {
  template: "#arks-new-page",
  data: function() {
    return {
      description: "",
      user_id: "",
      image: "",
      location: "",
      dollar_id: "",
      image: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        description: this.description,
        image: this.image,
        location: this.location
      };
      axios
        .post("/api/arks", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
    // getUserId: function() {
    //   return localStorage.getItem("user_id");
    // }
  },
};


var DollarsIndexPage = {
  template: "#dollars-index-page",
  data: function() {
    return {
      dollars: [],
      currentDollar: {}
    };
  },
  created: function() {
    axios.get("/api/dollars").then(function(response){
      this.dollars = response.data;
      console.log(this.dollars);
    }.bind(this));
  },
  methods: {
    setCurrentDollar: function(dollar) {
      this.currentDollar = dollar;
      console.log(this.currentDollar);
      router.push("/dollars/" + this.currentDollar.id)
      }
    },
  computed: {}
};

var DollarsShowPage = {
  template: "#dollars-show-page",
  data: function() {
    return {
      dollar: {}
    };
  },
  created: function() {
    axios.get("/api/dollars/" + this.$route.params.id).then(function(response){
      this.dollar = response.data;
      console.log(this.dollar);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var FaqsPage = {
  template: "#faqs-page",
  data: function() {
    return {
     };
  },
  methods: {},
  computed: {}
};

var InspirationPage = {
  template: "#inspiration-page",
  data: function() {
    return {
      };
  },
  methods: {},
  computed: {}
};

var UsersShowPage = 
{
  template: "#users-show-page",
  data: function() 
  {
    return {
      user: {}
    };
  },
  created: function() 
  {
      axios.get("/users/" + this.$route.params.id).then(function(response)
      {
        this.user = response.data;
        console.log(this.user);
      }.bind(this));
    },
    methods: {
         getUserId: function() {
               return localStorage.getItem("user_id");
             }
       },
       computed: {}
     };

var UsersEditPage = {
  template: "#users-edit-page",
  data: function() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      image: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/users/" + this.$route.params.id).then(function(response){
      this.first_name = response.data.first_name;
      this.last_name = response.data.last_name;
      this.email = response.data.email;
      this.image = response.data.image;
      console.log(this.user);
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        image: this.image
      };
      axios
        .patch("/users/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/users/" + this.$route.params.id);
          console.log(this.user);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var UsersDeletePage = {
  template: "#users-delete-page",
  data: function() {
    return {
      first_name: "",
      last_name: "",
      email: "",
      image: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/users/" + this.$route.params.id).then(function(response){
      this.first_name = response.data.first_name;
      this.last_name = response.data.last_name;
      this.email = response.data.email;
      this.image = response.data.image;
      console.log(this.user);
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: "softdeleted" + this.email,
        image: this.image
        // password and confirmation logic???
      };
      axios
        .patch("/users/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
          console.log(this.user);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/arks", component: ArksIndexPage },
    { path: "/arks/new", component: ArksNewPage },
    { path: "/arks/:id", component: ArksShowPage },

    { path: "/dollars", component: DollarsIndexPage },
    { path: "/faqs", component: FaqsPage },
    { path: "/inspiration", component: InspirationPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/users/:id", component: UsersShowPage },
    { path: "/dollars/:id", component: DollarsShowPage },
    { path: "/users/:id/edit", component: UsersEditPage },
    { path: "/users/:id/delete", component: UsersDeletePage },
    { path: "/logout", component: LogoutPage },
    { path: "/arks/:id/edit", component: ArksEditPage }
  ]
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  data: function() 
  {
    return {
      user_id: ""
    };
  },
  created: function() {
    this.user_id = localStorage.getItem("user_id");
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }, 
  methods: {
    isLoggedIn:function(){
      if (localStorage.getItem("user_id")){
        return true;
      }
      return false;
    }
  },
});