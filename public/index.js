/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      arks: [],
      currentArk: {},
      message: "Welcome to the ARK of the Whammynet!!!                                                        Make the world a better place, enjoy doing a real or random act of kindness! You're in the right place!"
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
          localStorage.setItem("id", response.data.user.id);
          location.reload();
          // router.push("/");
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
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var DollarPage = {
  template: "#dollar-page",
  data: function() {
    return {
      dollars: []
    };
  },
  created: function() {
    axios.get("/api/dollars").then(function(response){
      this.dollars = response.data;
      console.log(this.dollars);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var UsersShowPage = 
{
  template: "#users-show-page",
  data: function() 
  {
    return{
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
    methods: 
    {},
    computed: {}
};

// var UsersEditPage = {
//   template: "#users-edit-page",
//   data: function() {
//     return {
//       first_name: "",
//       last_name: "",
//       email: "",
//       image: "",
//       password: "",
//       passwordConfirmation: "",
//       errors: []
//     };
//   },
//   created: function() {
//     axios.get("/users/" + this.$route.params.id).then(function(response){
//       this.first_name = response.data.first_name;
//       this.last_name = response.data.last_name;
//       this.email = response.data.email;
//       this.image = response.data.image;
//       this.password = response.data.password;
//       this.passwordConfirmation = response.data.passwordConfirmation;


//     }.bind(this));
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         first_name: this.first_name,
//         last_name: this.last_name,
//         email: this.email,
//         image: this.image,
//         password: this.password,
//         passwordConfirmation: this.passwordConfirmation,
//         // password and confirmation logic???
//       };
//       axios
//         .patch("/users/" + this.$route.params.id, params)
//         .then(function(response) {
//           router.push("/users/" + this.$route.params.id);
//         }.bind(this))
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/dollars", component: DollarPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/users/:id", component: UsersShowPage },
    // { path: "/users/:id/edit", component: UsersEditPage },
    // how does edit get to update without client route?
    { path: "/logout", component: LoginPage }
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
    this.user_id = localStorage.getItem("id");
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});