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
                    <a class="navbar-brand topnav" href=" {{url('/')}} ">SI LKMM-TL</a>
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
                     Tambah Data Universitas / Kampus
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
                    <form action="{{url('tambahuniv/tambah')}}" method="post" role="form">
                        <div class="box-body">
                           {{ csrf_field() }}
                           <div class="form-group">
                                <label for="exampleInputEmail1">Universitas / Institut</label>
                                <input name="univ" type="text" class="form-control" id="exampleInputEmail1" placeholder="Institut Teknologi Sepuluh Nopember" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Fakultas</label>
                                <input name="fak" type="text" class="form-control" id="exampleInputEmail1" placeholder="Fakultas Teknologi Informasi" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Jurusan</label>
                                <input name="jur" type="text" class="form-control" id="exampleInputEmail1" placeholder="Teknik Informatika" required="">
                            </div>

                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" class="btn btn-primary pull-right">Tambah</button>
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

<script type="text/javascript">
    $(document).ready(function(){
    $('input[type="checkbox"]').click(function(){
        var inputValue = $(this).attr("value");
        $("." + inputValue).toggle();
    });
});

</script>

</body>

</html>
