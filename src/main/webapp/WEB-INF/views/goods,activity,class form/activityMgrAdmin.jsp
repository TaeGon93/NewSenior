<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
    <meta charset="utf-8">
    <title>Gardener - Gardening Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/JSbtstr/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/JSbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/JSbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<body>
  <!-- Layout wrapper -->
  <div class="content-wrapper" style="left: 300px; flex-direction: row; min-height: 500px;">
      <!-- Menu -->

      <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme"
       style="top: 30px; display: inline-block; width: 300px; height: 400px;">
        
        <ul class="menu-inner py-1">

          <!-- ???????????? -->
          <li class="menu-item">
            <a href="memberMgrAdmin.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">?????? ??????</div>
            </a>
          </li>

          <!-- ??????????????? -->
          <li class="menu-item">
            <a href="classMgrTeacher.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-collection"></i>
              <div data-i18n="Basic">???????????????(???????????????)</div>
            </a>
          </li>
          <!-- ??????????????? -->
          <li class="menu-item">
            <a href="classEnroll.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">????????? ??????</div>
            </a>
          </li>

          <!-- ?????????????????? -->
          <li class="menu-item ">
            <a href="activityEnroll.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">???????????? ??????</div>
            </a>
          </li>

          <!-- ?????????????????? -->
          <li class="menu-item active">
            <a href="activityMgrAdmin.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">???????????? ??????</div>
            </a>
          </li>

          <!-- ???????????? -->
          <li class="menu-item ">
            <a href="goodsEnroll.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">?????? ??????</div>
            </a>
          </li>

          <!-- ???????????? -->
          <li class="menu-item">
            <a href="goodsMgrAdmin.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">?????? ??????</div>
            </a>
          </li>

          <!-- Tables -->
          <li class="menu-item">
            <a href="classMgrAdmin.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-table"></i>
              <div data-i18n="Tables">???????????????(??????????????????)</div>
            </a>
          </li>

          <!-- ???????????? -->
          <li class="menu-item ">
            <a href="cart.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-table"></i>
              <div data-i18n="Tables">????????????</div>
            </a>
          </li>

          <!-- ??????????????? -->
          <li class="menu-item  ">
            <a href="mypage.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">???????????????</div>
            </a>
          </li>
        </ul>
      </aside>
      <!-- / Menu -->

        <!-- Layout container -->
        


          <!-- Content wrapper -->
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              

              <!-- Examples -->
              <div style="font-size: 25px;">??????????????????</div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th style="width: 20px;">
                          <label>???????????? <input type="checkbox" style="width: 15px; height: 15px; "></label>
                        </th>
                        <th style="width: 20px;">??????</th>
                        <th style="padding-left: 35px;">??????</th>
                        <th>?????????</th>
                        <th>??????</th>
                        <th>????????????</th>
                        <th>??????</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">1</td>
                        <td>??????</td>
                        <td>????????????</td>
                        <td>500???</td>
                        <td>???,??????,???</td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>??????</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>??????</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
</div></div>

             

  
            <!-- / Content -->
<%@include file="/WEB-INF/views/common/footer.jsp" %>



            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
