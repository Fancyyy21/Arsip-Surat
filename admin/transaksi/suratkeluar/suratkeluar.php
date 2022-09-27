<div class="main-panel">
  <div class="content">
    <div class="page-inner">
      <div class="page-header">
        <h4 class="page-title">Data Surat Keluar</h4>
        <ul class="breadcrumbs">
          <li class="nav-home">
            <a href="#">
              <i class="flaticon-home"></i>
            </a>
          </li>
          <li class="separator">
            <i class="flaticon-right-arrow"></i>
          </li>
          <li class="nav-item">
            <a href="#">Data</a>
          </li>
          <li class="separator">
            <i class="flaticon-right-arrow"></i>
          </li>
          <li class="nav-item">
            <a href="#">Surat Keluar</a>
          </li>
        </ul>
      </div>
      <div class="row">

        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <div class="d-flex align-items-center">
                <h4 class="card-title">Data Surat Keluar</h4>
                <?php if ($_SESSION['level'] == 'admin') { ?>
                  <a href="?view=addSuratKeluar" class="btn btn-primary btn-round ml-auto">
                    <i class="fa fa-plus"></i>
                    Add Data
                  </a>
                <?php } ?>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table id="add-row" class="display table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>No Srt Klr</th>
                      <!-- <th>No Agenda Srt Klr</th> -->
                      <th>Tujuan Surat</th>
                      <th>Kategori Surat</th>
                      <th>Tgl Srt Klr</th>
                      <th>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    <?php
                    $no = 1;
                    $query = mysqli_query($conn, "SELECT sk.*, k.nama_kategori from suratkeluar sk join kategori k on
                                             k.id=sk.id_kategori");
                    while ($row = mysqli_fetch_array($query)) {
                    ?>
                      <tr>
                        <td><?php echo $no++ ?></td>
                        <td><?php echo $row['no_surat_keluar'] ?></td>
                        <td><?php echo $row['tujuan_surat'] ?></td>
                        <td><?php echo $row['nama_kategori'] ?></td>
                        <td><?php echo date('d F Y', strtotime($row['tgl_surat_keluar'])) ?></td>
                        <td>
                          <?php if ($_SESSION['level'] == 'admin') { ?>
                            <a href="?view=detailSuratKeluar&id=<?php echo $row['id'] ?>" class="btn btn-xs btn-secondary"><i class="fa fa-eye"></i> Detail</a>
                            <a href="?view=editSuratKeluar&id=<?php echo $row['id'] ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i> Edit</a>
                            <a href="#modalHapusSuratKeluar<?php echo $row['id'] ?>" data-toggle="modal" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i> Hapus</a>
                          <?php } else { ?>
                            <a href="?view=detailSuratKeluar&id=<?php echo $row['id'] ?>" class="btn btn-xs btn-secondary"><i class="fa fa-eye"></i> Detail</a>
                          <?php } ?>
                        </td>
                      </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>


<?php
$q = mysqli_query($conn, "SELECT sk.*, k.nama_kategori from suratkeluar sk join kategori k on
                         k.id=sk.id_kategori");
while ($p = mysqli_fetch_array($q)) {
?>

  <div class="modal fade" id="modalHapusSuratKeluar<?php echo $p['id'] ?>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header no-bd">
          <h5 class="modal-title">
            <span class="fw-mediumbold">
              Hapus</span>
            <span class="fw-light">
              Surat Keluar
            </span>
          </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form method="POST" enctype="multipart/form-data" action="">
          <div class="modal-body">
            <input name="id" type="hidden" class="form-control" required value="<?php echo $p['id'] ?>">

            <div class="form-group">
              <h4>Apakah Anda Ingin Menghapus Data Ini ?</h4>
            </div>

          </div>
          <div class="modal-footer no-bd">
            <button type="submit" name="hapus" class="btn btn-danger"><i class="fa fa-trash"></i> Hapus</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-undo"></i> Close</button>
          </div>
        </form>
      </div>
    </div>
  </div>

<?php } ?>

<?php
if (isset($_POST['hapus'])) {
  $id = $_POST['id'];
  mysqli_query($conn, "DELETE from suratkeluar where id='$id'");
  echo "
                             <script type='text/javascript'>
                                setTimeout(function () {
                                       swal({
                                        title: 'Berhasil Menghapus Data',
                                        text:  'Berhasil Menghapus Data',
                                        type: 'success',
                                        icon: 'success',
                                        timer: 2000,
                                        showConfirmButton: true
                                       });
                                      },10);
                                 window.setTimeout(function(){
                                 window.location.replace('?view=suratkeluar');
                               } ,2000);
                             </script>";
}

?>