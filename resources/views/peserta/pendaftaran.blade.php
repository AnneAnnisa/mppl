<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SI LKMM TL</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="{{url('/bootstrap/css/bootstrap.min.css')}}">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="{{url('/plugins/datatables/dataTables.bootstrap.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{url('/dist/css/AdminLTE.min.css')}}">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
  folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="{{url('/dist/css/skins/_all-skins.min.css')}}">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <!-- Site wrapper -->
  <div class="">


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1 style="text-align: center;">
          Formulir Pendaftaran Latihan Keterampilan Manajemen Mahasiswa Tingkat Lanjut <br> LKMM-TL
        </h1>
      </section>

      <!-- Main content -->
      <section class="content">

        <div class="row">
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <!-- general form elements -->
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title"></h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form role="form">
                <div class="box-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nomor Induk Mahasiswa (NIM)</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="5114100024">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nama Lengkap</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Setyassida Novian Putra D">
                  </div>
                  <div class="form-group">
                    <label>Universitas Asal</label>
                    <select class="form-control">
                      <option>Institut Teknologi Sepuluh Nopember (ITS)</option>
                      <option>Universitas Gadjah Mada (UGM)</option>
                      <option>Universitas Sebelas Maret (UNS)</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Fakultas</label>
                    <select class="form-control">
                      <option>Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)</option>
                      <option>Fakultas Tekni Sipil dan Perencanaan (FTSP)</option>
                      <option>Fakultas Teknologi Industri (FTI)</option>
                      <option>Fakultas Teknologi Kelautan (FTK)</option>
                      <option>Fakultas Teknologi Informasi (FTIf)</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Alamat Email</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="setyassida@gmail.com">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nomor Telepon</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="085725017999">
                  </div>

                  <div class="form-group">
                    <label for="exampleInputEmail1">Alamat Tempat Tinggal</label>
                    <textarea class="form-control" rows="3" placeholder="Gebang Wetan No. 21, Sukolilo Surabaya"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Motivasi Mendaftar LKMM-TL 2017</label>
                    <textarea class="form-control" rows="3" placeholder="Saya ingin mengikuti LKMM-TL 2017 karena ..."></textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">File CV</label>
                    <input type="file" id="exampleInputFile">

                    <p class="help-block">Format file cv berupa .pdf</p>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Foto</label>
                    <input type="file" id="exampleInputFile">

                    <p class="help-block">Format file cv berupa .jpg atau .jpeg dengan ukuran file maksimal 2 Mb</p>
                  </div>

                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" class="btn btn-primary pull-right">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.box -->

          </div>

        </div>

      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

  <!-- jQuery 2.2.3 -->
  <script src="{{url('/plugins/jQuery/jquery-2.2.3.min.js')}}"></script>
  <!-- Bootstrap 3.3.6 -->
  <script src="{{url('/bootstrap/js/bootstrap.min.js')}}"></script>
  <!-- DataTables -->
  <script src="{{url('/plugins/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{url('/plugins/datatables/dataTables.bootstrap.min.js')}}"></script>
  <!-- SlimScroll -->
  <script src="{{url('/plugins/slimScroll/jquery.slimscroll.min.js')}}"></script>
  <!-- FastClick -->
  <script src="{{url('/plugins/fastclick/fastclick.js')}}"></script>
  <!-- AdminLTE App -->
  <script src="{{url('/dist/js/app.min.js')}}"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="{{url('/dist/js/demo.js')}}"></script>
  <script src="{{url('/js/moment.js')}}"></script>
  <script src="{{url('/js/bootstrap-datetimepicker.min.js')}}"></script>
  @yield('js')


  <script>
    $(function () {
      $("#example1").DataTable();
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
      });
    });
  </script>

</body>
</html>
