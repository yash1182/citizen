exports.client = function (baseUrl, token) {
  self = this;
  self.baseUrl = baseUrl;
  self.token = token;
  return {
    getInfo: function () {
      return fetch(self.baseUrl + "/", {
        method: "GET",
      });
    },
    getByUserId: function (userId) {
      return fetch(self.baseUrl + "/" + userId, {
        method: "GET",
        headers: {
          authorization: "Bearer " + self.token,
        },
      }).then((res) => res.json());
    },
    addUser: function (payload) {
      if (!payload) {
        throw new Error("User object is required!");
      }
      return fetch(self.baseUrl + "/" + userId, {
        method: "GET",
        headers: { "content-type": "application/json" },
        body: JSON.stringify(payload),
      }).then((res) => res.json());
    },
  };
};
