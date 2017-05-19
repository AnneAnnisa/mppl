<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SI LKMM-TL</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="{{url('/bootstrap/css/bootstrap.min.css')}}">

    <!-- Custom CSS -->
    <link href="{{url('/css/landing-page.css')}}" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="{{url('/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
            <div class="container topnav">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand topnav" href="#">SI LKMM-TL</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#services">Daftar</a>
                        </li>
                        <li>
                            <a href="#contact">Kontak</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>


        <!-- Header -->
        <a name="about"></a>
        <div class="intro-header">
            

        </div>
        <!-- /.intro-header -->

        <!-- Page Content -->

        <a  name="services"></a>
        <div class="content-section-a">

            <div class="container">
            <section class="content-header">
        <h2 style="text-align: center;">
          Formulir Pendaftaran Latihan Keterampilan Manajemen Mahasiswa Tingkat Lanjut <br> LKMM-TL
        </h2>
      </section>
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
                        <form action="{{url('pendaftaran/tambah')}}" method="post" role="form">
                            <div class="box-body">
                             {{ csrf_field() }}
                              <div class="form-group">
                                <label for="exampleInputEmail1">Nomor Induk Mahasiswa (NIM)</label>
                                <input name="nim" type="number" class="form-control" id="exampleInputEmail1" placeholder="5114100024" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nama Lengkap</label>
                                <input name="nama" type="text" class="form-control" id="exampleInputEmail1" placeholder="Setyassida Novian Putra D" required="">
                            </div>
                            <div class="form-group">
                                <label>Kampus Asal</label>
                                <select name="kampus" class="form-control">
                                  @foreach($pendidikan as $pend)
                                  <option>{{$pend->jurusan}}</option>
                                  @endforeach
                              </select>
                              
                          </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">Alamat Email</label>
                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="setyassida@gmail.com" required="">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nomor Telepon</label>
                        <input name="telepon" type="number" class="form-control" id="exampleInputEmail1" placeholder="085725017999" required="">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Alamat Tempat Tinggal</label>
                        <textarea name="alamat" class="form-control" rows="3" placeholder="Gebang Wetan No. 21, Sukolilo Surabaya" required=""></textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Motivasi Mendaftar LKMM-TL 2017</label>
                        <textarea name="motivasi" class="form-control" rows="3" placeholder="Saya ingin mengikuti LKMM-TL 2017 karena ..." required=""></textarea>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">File CV</label>
                        <input type="file" id="exampleInputFile" >

                        <p class="help-block">Format file cv berupa .pdf</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Foto</label>
                        <input type="file" id="exampleInputFile" >

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

</div>
<!-- /.container -->

</div>
<!-- /.content-section-a -->
<a  name="contact"></a>
<div class="banner">

    <div class="container">

        <div class="row">
            <div class="col-lg-6">
                <h2>Jangkau kami di :</h2>
            </div>
            <div class="col-lg-6">
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                    </li>
                    <li>
                        <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.banner -->

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-inline">
                    <li>
                        <a href="landing">Home</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="landing">Tentang</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="landing">Services</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="landing">Kontak</a>
                    </li>
                </ul>
                <p class="copyright text-muted small">Copyright &copy; Zikrul.Ovan.Anne@MPPL2017. All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="{{url('/js/jquery.js')}}"></script>

<!-- Bootstrap Core JavaScript -->
<script src="{{url('/js/bootstrap.min.js')}}"></script>

</body>

</html>
