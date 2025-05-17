let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".sidebar");
let main = document.querySelector(".main");

toggle.onclick = function () {
  navigation.classList.toggle("active");
  main.classList.toggle("active");
};

           

// document.addEventListener('DOMContentLoaded', function () {
//   const submenuParents = document.querySelectorAll('.sidebar-menu li');

//   submenuParents.forEach(function (item) {
//     item.addEventListener('click', function (e) {
//       // Prevent default link behavior
//       e.preventDefault();

//       // Toggle submenu
//       const submenu = item.querySelector('ul');
//       if (submenu) {
//         submenu.classList.toggle('show');
//       }
//     });
//   });
// });



document.addEventListener('DOMContentLoaded', function () {
  const submenuParents = document.querySelectorAll('.sidebar-menu li.has-submenu');

  submenuParents.forEach(function (item) {
    item.addEventListener('click', function (e) {
      // Check if the clicked element is the parent <a>, not a submenu <a>
      const clickedInsideSubmenu = e.target.closest('ul.submenu');
      if (clickedInsideSubmenu) {
        // Let submenu links behave normally
        return;
      }

      e.preventDefault();

      // Close all other submenus
      submenuParents.forEach(function (otherItem) {
        if (otherItem !== item) {
          const otherSubmenu = otherItem.querySelector('ul.submenu');
          if (otherSubmenu) {
            otherSubmenu.classList.remove('show');
          }
        }
      });

      // Toggle clicked one
      const submenu = item.querySelector('ul.submenu');
      if (submenu) {
        submenu.classList.toggle('show');
      }
    });
  });
  
              $(".enty").click(function() {
                var page = $(this).data("page"); // Get the data-page attribute
                if (page) { // Check if page is defined
                    getHTMLResponse(page, "GET", null,null)
                        .then(function(htmlResponse) {
                            $("#display").html(htmlResponse); // Update the element here
                        })
                        .catch(function(error) {
                            console.error("Error:", error);
                        $("#display").html("Error: " + error);
                    });
                } else {
                    $("#display").html("No page specified for this navigation item.");
                }
            });
});