
        const hamburgerBtn = document.getElementById("hamburger-btn");
        const mobileMenu = document.getElementById("mobile-menu");
        const closeMenuBtn = document.getElementById("close-menu-btn");
        const mobileMenuLinks = mobileMenu.querySelectorAll("a");
        const navLinks = document.querySelectorAll('header nav a');
        const sections = document.querySelectorAll('section');

        function toggleMobileMenu() {
            mobileMenu.classList.toggle("hidden");
        }

        hamburgerBtn.addEventListener("click", toggleMobileMenu);
        closeMenuBtn.addEventListener("click", toggleMobileMenu);
        mobileMenuLinks.forEach(link => {
            link.addEventListener("click", toggleMobileMenu);
        });

        document.addEventListener('click', (event) => {
            if (!mobileMenu.classList.contains('hidden') && !mobileMenu.contains(event.target) && event.target !== hamburgerBtn) {
                toggleMobileMenu();
            }
        });

        function updateActiveNavLink() {
            let currentSectionId = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (window.scrollY >= sectionTop - 100 && window.scrollY < sectionTop + sectionHeight - 100) {
                    currentSectionId = section.getAttribute('id');
                }
            });

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href').slice(1) === currentSectionId) {
                    link.classList.add('active');
                }
            });
        }

        window.addEventListener('scroll', updateActiveNavLink);

        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();

                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });