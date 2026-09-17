<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container mt-4">

    <!-- ============================= -->
    <!-- TIÊU ĐỀ -->
    <!-- ============================= -->

    <div class="d-flex justify-content-between align-items-center mb-3">

        <h2>QUẢN LÝ CATEGORY</h2>

        <button type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#addCategoryModal">
            + Thêm Category
        </button>

    </div>


    <!-- ============================= -->
    <!-- BẢNG CATEGORY -->
    <!-- ============================= -->

    <table class="table table-bordered table-hover">

        <thead class="table-dark">

            <tr>
                <th>ID</th>
                <th>Tên Category</th>
                <th>Icon</th>
                <th>Thao tác</th>
            </tr>

        </thead>

        <tbody id="categoryTableBody">
        </tbody>

    </table>

</div>


<!-- ================================================= -->
<!-- MODAL THÊM CATEGORY -->
<!-- ================================================= -->

<div class="modal fade"
     id="addCategoryModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Thêm Category
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <div class="modal-body">

                <form id="addCategoryForm">

                    <!-- Tên Category -->

                    <div class="mb-3">

                        <label class="form-label">
                            Tên Category
                        </label>

                        <input type="text"
                               class="form-control"
                               id="categoryName"
                               required>

                    </div>


                    <!-- Icon -->

                    <div class="mb-3">

                        <label class="form-label">
                            Icon
                        </label>

                        <input type="file"
                               class="form-control"
                               id="categoryIcon"
                               accept="image/*">

                    </div>


                    <button type="submit"
                            class="btn btn-primary">
                        Lưu
                    </button>

                </form>

            </div>

        </div>

    </div>

</div>


<!-- ================================================= -->
<!-- MODAL SỬA CATEGORY -->
<!-- ================================================= -->

<div class="modal fade"
     id="editCategoryModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Sửa Category
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <div class="modal-body">

                <form id="editCategoryForm">

                    <!-- ID -->

                    <input type="hidden"
                           id="editCategoryId">


                    <!-- Tên Category -->

                    <div class="mb-3">

                        <label class="form-label">
                            Tên Category
                        </label>

                        <input type="text"
                               class="form-control"
                               id="editCategoryName"
                               required>

                    </div>


                    <!-- Icon mới -->

                    <div class="mb-3">

                        <label class="form-label">
                            Icon mới
                        </label>

                        <input type="file"
                               class="form-control"
                               id="editCategoryIcon"
                               accept="image/*">

                        <small class="text-muted">
                            Nếu không chọn ảnh mới thì giữ nguyên icon cũ.
                        </small>

                    </div>


                    <!-- Icon hiện tại -->

                    <div class="mb-3">

                        <label class="form-label">
                            Icon hiện tại
                        </label>

                        <div id="currentCategoryIcon">
                        </div>

                    </div>


                    <button type="submit"
                            class="btn btn-warning">
                        Cập nhật
                    </button>

                </form>

            </div>

        </div>

    </div>

</div>


<!-- ================================================= -->
<!-- AJAX CATEGORY -->
<!-- ================================================= -->

<script>

$(document).ready(function() {

    loadCategories();

});


/* ================================================= */
/* LOAD CATEGORY */
/* ================================================= */

function loadCategories() {

    $.getJSON(
        contextPath + "/api/category",

        function(data) {

            $("#categoryTableBody").empty();

            $.each(data, function(index, category) {

                var row = "";

                row += "<tr id='category-" + category.id + "'>";

                /* ID */

                row += "<td>";
                row += category.id;
                row += "</td>";


                /* NAME */

                row += "<td>";
                row += category.name || "";
                row += "</td>";


                /* ICON */

                row += "<td>";

                if (category.icon) {

                    row += "<img src='"
                        + contextPath
                        + "/uploads/"
                        + category.icon
                        + "' "
                        + "width='60' "
                        + "height='60' "
                        + "class='img-thumbnail'>";

                } else {

                    row += "Không có";

                }

                row += "</td>";


                /* ACTIONS */

                row += "<td>";

                row += "<button "
                    + "type='button' "
                    + "class='btn btn-warning btn-sm me-2' "
                    + "onclick='editCategory("
                    + category.id
                    + ")'>"
                    + "Sửa"
                    + "</button>";

                row += "<button "
                    + "type='button' "
                    + "class='btn btn-danger btn-sm' "
                    + "onclick='deleteCategory("
                    + category.id
                    + ")'>"
                    + "Xóa"
                    + "</button>";

                row += "</td>";

                row += "</tr>";

                $("#categoryTableBody").append(row);

            });

        }

    ).fail(function(xhr) {

        console.log(xhr.responseText);

        alert("Không thể tải danh sách Category!");

    });

}


/* ================================================= */
/* THÊM CATEGORY */
/* ================================================= */

$("#addCategoryForm").submit(function(event) {

    event.preventDefault();


    /* Tạo FormData */

    var formData = new FormData();


    /* Tên Category */

    formData.append(
        "name",
        $("#categoryName").val()
    );


    /* File Icon */

    var iconFile =
        $("#categoryIcon")[0].files[0];


    if (iconFile) {

        formData.append(
            "icon",
            iconFile
        );

    }


    /* AJAX */

    $.ajax({

        url: contextPath + "/api/category",

        type: "POST",

        data: formData,

        contentType: false,

        processData: false,


        success: function(result) {

            alert(
                "Thêm Category thành công!"
            );


            /* Đóng modal */

            var modalElement =
                document.getElementById(
                    "addCategoryModal"
                );

            var modal =
                bootstrap.Modal.getInstance(
                    modalElement
                );

            if (modal) {

                modal.hide();

            }


            /* Reset form */

            $("#addCategoryForm")[0].reset();


            /* Load lại danh sách */

            loadCategories();

        },


        error: function(xhr) {

            console.log(xhr.responseText);

            alert(
                "Thêm Category thất bại!"
            );

        }

    });

});


/* ================================================= */
/* LẤY CATEGORY ĐỂ SỬA */
/* ================================================= */

function editCategory(id) {

    $.getJSON(

        contextPath
        + "/api/category/"
        + id,

        function(category) {

            /* ID */

            $("#editCategoryId")
                .val(category.id);


            /* Name */

            $("#editCategoryName")
                .val(category.name || "");


            /* Reset file */

            $("#editCategoryIcon")
                .val("");


            /* Hiển thị icon hiện tại */

            if (category.icon) {

                $("#currentCategoryIcon").html(

                    "<img src='"
                    + contextPath
                    + "/uploads/"
                    + category.icon
                    + "' "
                    + "width='80' "
                    + "height='80' "
                    + "class='img-thumbnail'>"

                );

            } else {

                $("#currentCategoryIcon")
                    .html("Không có icon");

            }


            /* Hiển thị modal */

            var modalElement =
                document.getElementById(
                    "editCategoryModal"
                );

            var modal =
                bootstrap.Modal.getOrCreateInstance(
                    modalElement
                );

            modal.show();

        }

    ).fail(function(xhr) {

        console.log(xhr.responseText);

        alert(
            "Không thể lấy thông tin Category!"
        );

    });

}


/* ================================================= */
/* CẬP NHẬT CATEGORY */
/* ================================================= */

$("#editCategoryForm").submit(function(event) {

    event.preventDefault();


    /* Lấy ID */

    var id =
        $("#editCategoryId").val();


    /* Tạo FormData */

    var formData =
        new FormData();


    /* Tên */

    formData.append(
        "name",
        $("#editCategoryName").val()
    );


    /* Icon mới */

    var iconFile =
        $("#editCategoryIcon")[0].files[0];


    if (iconFile) {

        formData.append(
            "icon",
            iconFile
        );

    }


    /* AJAX PUT */

    $.ajax({

        url:
            contextPath
            + "/api/category/"
            + id,

        type: "PUT",

        data: formData,

        contentType: false,

        processData: false,


        success: function(response) {

            alert(
                "Cập nhật Category thành công!"
            );


            /* Đóng modal */

            var modalElement =
                document.getElementById(
                    "editCategoryModal"
                );

            var modal =
                bootstrap.Modal.getInstance(
                    modalElement
                );

            if (modal) {

                modal.hide();

            }


            /* Load lại bảng */

            loadCategories();

        },


        error: function(xhr) {

            console.log(xhr.responseText);

            alert(
                "Có lỗi khi cập nhật Category!"
            );

        }

    });

});


/* ================================================= */
/* XÓA CATEGORY */
/* ================================================= */

function deleteCategory(id) {

    if (!confirm(
        "Bạn có chắc muốn xóa Category này không?"
    )) {

        return;

    }


    $.ajax({

        url:
            contextPath
            + "/api/category/"
            + id,

        type: "DELETE",


        success: function(response) {

            alert(
                "Xóa Category thành công!"
            );


            $("#category-" + id).remove();

        },


        error: function(xhr) {

            console.log(
                xhr.responseText
            );


            if (xhr.status === 404) {

                alert(
                    "Không tìm thấy Category!"
                );

            } else {

                alert(
                    "Xóa Category thất bại!"
                );

            }

        }

    });

}

</script>