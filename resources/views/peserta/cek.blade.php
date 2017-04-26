@extends('include.master')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1 style="text-align: center;">
      <b>Cek Status Seleksi</b> <br>Latihan Keterampilan Manajemen Mahasiswa Tingkat Lanjut <br> LKMM-TL
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

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
              <div class="btn btn-primary">
                <a style="color: white;" href=" {{url('/peserta/status')}} ">Submit</a>
              </div>
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


@endsection
