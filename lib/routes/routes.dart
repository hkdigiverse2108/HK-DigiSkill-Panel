class AdminRoutes {
  static const login = '/login';
  static const otp = '/otp';
  static const forgotPassword = '/forgot-password/';
  static const resetPassword = '/reset-password/';
  static const dashboard = '/dashboard';
  static const transactions = '/transactions';

  // Category
  static const category = '/category';
  static const createCategory = '/category-create';
  static const editCategory = '/category-edit';

  // Workshop
  static const workshop = '/workshop';
  static const createWorkshop = '/workshop-create';
  static const editWorkshop = '/workshop-edit';

  // media
  static const media = '/media';

  static const course = '/course';
  static const wWorkshops = '/workshops';
  static const wCurriculum = '/workshopsCurriculum';
  static const wBuy = '$workshop/buy';
  static const wFaq = '/workshopFaq';
  static const wTestimonials = '$workshop/testimonials';
  static const cCourses = '$course/courses';
  static const cLessons = '$course/lessons';
  static const cCurriculum = '$course/curriculum';
  static const cBuy = '$course/buy';
  static const cFaq = '$course/faq';
  static const cTestimonials = '$course/testimonials';
  static const couponCode = '/coupon-code';
  static const deletedAccounts = '/deleted-accounts';
  static const trustedPartners = '/trusted-partners';
  static const faq = '/faq';
  static const createFaq = '/faq-create';
  static const editFaq = '/faq-edit';
  static const testimonials = '/testimonials';
  static const createTestimonial = '/testimonials-create';
  static const editTestimonial = '/testimonials-edit';
  static const adminUsers = '/admin-users';
  static const blog = '/blog';
  static const getInTouch = '/get-in-touch';
  static const editGetInTouch = '/get-in-touch-edit';
  static const gallery = '/gallery';
  static const createGallery = '/gallery-create';
  static const editGallery = '/gallery-edit';
  static const newsLetter = '/news-letter';
  static const banners = '/banners';
  static const createBanner = '/banners-create';
  static const editBanner = '/banners-edit';
  static const legality = '/legality';
  static const privacyPolicy = '/privacy-policy';
  static const termsConditions = '/terms-conditions';
  static const addNewUsers = '/add-new-users';
  static const users = '/users';
  static const changePassword = '/change-password';
  static const settings = '/settings';

  static List sidebarMenuItems = [
    dashboard,
    media,
    transactions,
    category,
    workshop,
    course,
    couponCode,
    deletedAccounts,
    trustedPartners,
    faq,
    testimonials,
    adminUsers,
    blog,
    getInTouch,
    gallery,
    newsLetter,
    banners,
    legality,
    privacyPolicy,
    termsConditions,
    users,
    settings,
  ];
}
