class AdminRoutes {
  static const login = '/login';
  static const otp = '/otp';
  static const forgotPassword = '/forgot-password/';
  static const resetPassword = '/reset-password/';
  static const dashboard = '/dashboard';

  // static const transactions = '/transactions';

  // Category
  static const category = '/category';
  static const createCategory = '/category-create';
  static const editCategory = '/category-edit';

  // Workshop
  static const workshop = '/workshop';
  static const createWorkshop = '/workshop-create';
  static const editWorkshop = '/workshop-edit';
  static const wFaq = '/workshopFaq';
  static const wCreateFaq = '/workshopFaq-create';
  static const wEditFaq = '/workshopFaq-edit';
  static const wTestimonials = '/workshop-testimonials';
  static const wCreateTestimonial = '/workshop-testimonials-create';
  static const wEditTestimonial = '/workshop-testimonials-edit';
  static const wCurriculum = '/workshopsCurriculum';
  static const wCreateCurriculum = '/workshopsCurriculum-create';
  static const wEditCurriculum = '/workshopsCurriculum-edit';
  static const wBuy = '/workshop-buy';

  // media
  static const media = '/media';

  // Coupon
  static const couponCode = '/coupon-code';
  static const createCouponCode = '/coupon-code-create';
  static const editCouponCode = '/coupon-code-edit';

  // Trusted Partners
  static const trustedPartners = '/trusted-partners';
  static const editPartners = '/edit-partners';
  static const createPartners = '/create-partners';

  static const wWorkshops = '/workshops';
  static const cCourses = '$course/courses';

  // Course
  static const course = '/course';
  static const createCourse = '/course-create';
  static const editCourse = '/course-edit';
  static const cCurriculum = '/course-curriculum';
  static const cCreateCurriculum = '/course-curriculum-create';
  static const cEditCurriculum = '/course-curriculum-edit';
  static const cBuy = '$course/buy';
  static const cFaq = '/course-faq';
  static const cCreateFaq = '/course-faq-create';
  static const cEditFaq = '/course-faq-edit';
  static const cTestimonials = '/course-testimonials';
  static const cCreateTestimonial = '/course-testimonials-create';
  static const cEditTestimonial = '/course-testimonials-edit';
  static const cLessons = '/course-lesson';
  static const cCreateLesson = '/course-lesson-create';
  static const cEditLesson = '/course-lesson-edit';

  // Deleted Account
  static const deletedAccounts = '/deleted-accounts';

  // Blog
  static const blog = '/blog';
  static const createBlog = '/blog-create';
  static const editBlog = '/blog-edit';

  // FAQ
  static const faq = '/faq';
  static const createFaq = '/faq-create';
  static const editFaq = '/faq-edit';
  static const testimonials = '/testimonials';
  static const createTestimonial = '/testimonials-create';
  static const editTestimonial = '/testimonials-edit';

  // static const adminUsers = '/admin-users';

  static const getInTouch = '/get-in-touch';
  static const editGetInTouch = '/get-in-touch-edit';
  static const gallery = '/gallery';
  static const createGallery = '/gallery-create';
  static const editGallery = '/gallery-edit';
  static const banners = '/banners';
  static const createBanner = '/banners-create';
  static const editBanner = '/banners-edit';

  // Legality
  static const legality = '/legality';
  static const privacyPolicy = '/privacy-policy';
  static const termsConditions = '/terms-conditions';
  static const refundPolicy = '/refund-policy';
  static const aboutUs = '/about-us';

  static const addNewUsers = '/add-new-users';
  static const users = '/users';
  static const changePassword = '/change-password';
  static const settings = '/settings';

  // Newsletter
  static const newsLetter = '/newsletter';
  static const createNewsLetter = '/newsletter-create';
  static const editNewsLetter = '/newsletter-edit';

  // Instructors
  static const instructors = '/instructors';
  static const createInstructor = '/instructors-create';
  static const editInstructor = '/instructors-edit';

  static List sidebarMenuItems = [
    dashboard,
    media,
    // transactions,
    category,
    workshop,
    wCurriculum,
    wFaq,
    wWorkshops,
    wTestimonials,
    cCourses,
    cBuy,
    cFaq,
    cTestimonials,
    cLessons,
    course,
    couponCode,
    deletedAccounts,
    trustedPartners,
    faq,
    testimonials,
    // adminUsers,
    blog,
    getInTouch,
    gallery,
    newsLetter,
    banners,
    legality,
    privacyPolicy,
    termsConditions,
    refundPolicy,
    instructors,
    users,
    settings,
    wBuy,
  ];
}
