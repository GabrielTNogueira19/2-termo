let slideIndex = 1;

document.addEventListener("DOMContentLoaded", function () {
    showSlides(slideIndex);
});

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("cards");
    let dots = document.getElementsByClassName("pontos");

    if (slides.length === 0) return;

    if (n > slides.length) {
        slideIndex = 1;
    }

    if (n < 1) {
        slideIndex = slides.length;
    }

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    for (i = 0; i < dots.length; i++) {
        dots[i].classList.remove("active");
    }

    slides[slideIndex - 1].style.display = "block";

    if (dots.length > 0) {
        dots[slideIndex - 1].classList.add("active");
    }
}