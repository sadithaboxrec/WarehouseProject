function getHTMLResponse(url, method, dat , sdat){ // dat= object data, sdata=serialized data
    var data;
    if(dat===null&&sdat===null){
        data = null;
    }
    else{
        if(sdat===null){
            data = serializeAsKeyValueString(dat); // object data -> serialize
        }
        else if(dat===null){
            data = sdat; // !serialized data
        }  
    }
              
              console.log(data);
       return new Promise(function(resolve, reject) {
           console.log(data);
           if (data!==null){
                $.ajax({
                    url: url,
                    type: method,
                    data: data,
                    success: function(response) {
                        resolve(response); // Resolve the Promise with the response
                    },
                    error: function(xhr, status, error) {
                        reject(error+":"+status+":"+xhr); // Reject the Promise with the error
                    }
                });
           }
           else{
                $.ajax({
                    url: url,
                    type: method,
                    success: function(response) {
                        resolve(response); // Resolve the Promise with the response
                    },
                    error: function(xhr, status, error) {
                        reject(error+":"+status+":"+xhr); // Reject the Promise with the error
                    }
                });
           }
               

       });
}

function getHTMLResponsevidafileupload(url, dat){ // dat= object data, sdata=serialized data
              
       return new Promise(function(resolve, reject) {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: dat,
                    processData: false, //  Important
                    contentType: false, //  Important
                    success: function(response) {
                        resolve(response); // Resolve the Promise with the response
                    },
                    error: function(xhr, status, error) {
                        reject(error+":"+status+":"+xhr.responseText); // Reject the Promise with the error
                    }
                });
       });
}

function serializeAsKeyValueString(obj, delimiter = '&', assignment = '=') {
  const pairs = [];
  for (const key in obj) {
    if (Object.hasOwnProperty.call(obj, key)) {
      pairs.push(`${key}${assignment}${obj[key]}`);
    }
  }
  return pairs.join(delimiter);
}

function convertObjectToURLSearchParams(obj) {
  const params = new URLSearchParams();
  for (const key in obj) {
    if (Object.hasOwnProperty.call(obj, key)) {
      params.append(key, obj[key]);
    }
  }
  return params.toString();
}