<?php
include("koneksi.php");

// 1. Tentukan Tabel yang Sedang Aktif
$tabel_aktif = isset($_GET['tabel']) ? $_GET['tabel'] : 'tbl_users';

// Daftar tabel yang diperbolehkan
// PERUBAHAN: Menambahkan 'judul_lagu' di tbl_aside
$allowed_tables = [
    'tbl_users' => ['pk' => 'id_user', 'cols' => ['nim', 'nama_lengkap', 'foto_profil', 'foto_background']],
    'tbl_biodata' => ['pk' => 'id_biodata', 'cols' => ['nim', 'judul', 'isi']],
    'tbl_pendidikan' => ['pk' => 'id_pendidikan', 'cols' => ['nim', 'institusi', 'jurusan', 'tahun']],
    'tbl_pengalaman' => ['pk' => 'id_pengalaman', 'cols' => ['nim', 'judul', 'isi', 'foto']],
    'tbl_keahlian' => ['pk' => 'id_keahlian', 'cols' => ['nim', 'judul', 'isi']],
    'tbl_konten' => ['pk' => 'id_konten', 'cols' => ['nim', 'judul', 'isi', 'foto']],
    'tbl_aside' => ['pk' => 'id_aside', 'cols' => ['nim', 'foto', 'nama_kegiatan', 'judul_lagu', 'keterangan', 'lagu']],
    'tbl_footer' => ['pk' => 'id_footer', 'cols' => ['nim', 'linkedin', 'spotify', 'instagram', 'copyright', 'quote']],
    'tbl_nav_profile' => ['pk' => 'id_nav', 'cols' => ['nim', 'menu', 'aktif']]
];

if (!array_key_exists($tabel_aktif, $allowed_tables)) {
    $tabel_aktif = 'tbl_users';
}

$primaryKey = $allowed_tables[$tabel_aktif]['pk'];
$columns = $allowed_tables[$tabel_aktif]['cols'];

$v_id = "";
$v_data = [];
$op = isset($_GET['op']) ? $_GET['op'] : '';

// --- HAPUS DATA ---
if ($op == 'hapus') {
    $id = $_GET['id'];
    $DB->query("DELETE FROM $tabel_aktif WHERE $primaryKey = '$id'");
    echo "<script>alert('Data berhasil dihapus'); document.location='admin_profile.php?tabel=$tabel_aktif';</script>";
}

// --- EDIT DATA ---
if ($op == 'edit') {
    $id = $_GET['id'];
    $r = $DB->query("SELECT * FROM $tabel_aktif WHERE $primaryKey = '$id'");
    $v_data = $r->fetch_assoc();
    $v_id = $id;
}

// --- SIMPAN DATA ---
if (isset($_POST['simpan'])) {
    $id_val = $_POST['id_val']; 
    $set_values = [];
    $insert_cols = [];
    $insert_vals = [];

    foreach ($columns as $col) {
        $val = "";
        $is_file_upload = (strpos($col, 'foto') !== false || $col == 'lagu');

        if ($is_file_upload && isset($_FILES[$col])) {
            $nama_file = $_FILES[$col]['name'];
            $tmp_file = $_FILES[$col]['tmp_name'];
            if (!empty($nama_file)) {
                $nama_file_baru = time() . "_" . basename($nama_file); 
                move_uploaded_file($tmp_file, "uploads/" . $nama_file_baru);
                $val = $nama_file_baru;
            } else {
                if ($id_val != "") $val = $_POST[$col . '_old'];
            }
        } else {
            $val = isset($_POST[$col]) ? $DB->real_escape_string($_POST[$col]) : '';
        }

        $set_values[] = "$col = '$val'";
        $insert_cols[] = $col;
        $insert_vals[] = "'$val'";
    }

    if ($id_val) {
        $sql = "UPDATE $tabel_aktif SET " . implode(", ", $set_values) . " WHERE $primaryKey = '$id_val'";
    } else {
        $sql = "INSERT INTO $tabel_aktif (" . implode(", ", $insert_cols) . ") VALUES (" . implode(", ", $insert_vals) . ")";
    }

    if ($DB->query($sql)) {
        echo "<script>alert('Data berhasil disimpan'); document.location='admin_profile.php?tabel=$tabel_aktif';</script>";
    } else {
        echo "<div style='color:red'>Error: " . $DB->error . "</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f4f4; padding: 20px; }
        .nav-tabs { display: flex; flex-wrap: wrap; gap: 5px; margin-bottom: 20px; border-bottom: 2px solid #ddd; }
        .nav-tabs a { text-decoration: none; padding: 10px 15px; background: #fff; color: #333; margin-bottom: -2px; border: 1px solid transparent; }
        .nav-tabs a.active { border: 1px solid #ddd; border-bottom-color: #fff; font-weight: bold; color: #1a5632; }
        .container { display: flex; gap: 20px; flex-direction: column; }
        @media(min-width: 900px) { .container { flex-direction: row; } }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); flex: 1; }
        label { display: block; margin-top: 10px; font-weight: 600; font-size: 0.9rem; }
        input[type="text"], textarea { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
        .btn-save { background: #1a5632; color: white; padding: 10px 20px; border: none; cursor: pointer; margin-top: 15px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 8px; border: 1px solid #ddd; text-align: left; font-size: 0.9rem; }
        th { background: #1a5632; color: white; }
        .preview { max-width: 60px; }
        /* Style khusus untuk membedakan input */
        .input-group-hobi { border-left: 3px solid #e0a800; padding-left: 10px; margin-bottom: 10px; background: #fffdf0; padding: 10px; }
        .input-group-musik { border-left: 3px solid #EC8CA6; padding-left: 10px; margin-bottom: 10px; background: #fff0f5; padding: 10px; }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <div class="nav-tabs">
        <?php foreach ($allowed_tables as $tbl => $info): ?>
            <a href="?tabel=<?php echo $tbl; ?>" class="<?php echo ($tabel_aktif == $tbl) ? 'active' : ''; ?>">
                <?php echo strtoupper(str_replace('tbl_', '', $tbl)); ?>
            </a>
        <?php endforeach; ?>
    </div>

    <div class="container">
        <div class="card" style="flex: 0 0 350px;">
            <h3>Form Input</h3>
            <form action="" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="id_val" value="<?php echo $v_id; ?>">

                <?php if($tabel_aktif == 'tbl_aside'): ?>
                    <label>NIM</label>
                    <input type="text" name="nim" value="<?= $v_data['nim'] ?? '' ?>">

                    <div class="input-group-hobi">
                        <strong style="color:#b58900">BAGIAN 1: KARTU HOBI (FOTO)</strong>
                        <label>Foto Kegiatan</label>
                        <input type="file" name="foto">
                        <input type="hidden" name="foto_old" value="<?= $v_data['foto'] ?? '' ?>">
                        
                        <label>Nama Kegiatan (Muncul di Kartu)</label>
                        <input type="text" name="nama_kegiatan" value="<?= $v_data['nama_kegiatan'] ?? '' ?>" placeholder="Contoh: Membaca Buku">
                    </div>

                    <div class="input-group-musik">
                        <strong style="color:#d63384">BAGIAN 2: MUSIK PLAYER</strong>
                        <label>File Lagu (.mp3)</label>
                        <input type="file" name="lagu" accept=".mp3,audio/*">
                        <input type="hidden" name="lagu_old" value="<?= $v_data['lagu'] ?? '' ?>">

                        <label>Judul Lagu</label>
                        <input type="text" name="judul_lagu" value="<?= $v_data['judul_lagu'] ?? '' ?>" placeholder="Contoh: Kabar Bahagia">

                        <label>Nama Artis / Keterangan</label>
                        <input type="text" name="keterangan" value="<?= $v_data['keterangan'] ?? '' ?>" placeholder="Contoh: Rumahsakit">
                    </div>

                <?php else: ?>
                    <?php foreach ($columns as $col) { 
                        $val = $v_data[$col] ?? '';
                        if (strpos($col, 'foto') !== false) {
                            echo "<label>".strtoupper($col)."</label><input type='file' name='$col'><input type='hidden' name='{$col}_old' value='$val'>";
                        } elseif ($col == 'isi' || $col == 'quote') {
                            echo "<label>".strtoupper($col)."</label><textarea name='$col'>$val</textarea>";
                        } else {
                            echo "<label>".strtoupper($col)."</label><input type='text' name='$col' value='$val'>";
                        }
                    } ?>
                <?php endif; ?>

                <input type="submit" name="simpan" value="SIMPAN" class="btn-save">
            </form>
        </div>

        <div class="card">
            <h3>Data</h3>
            <div style="overflow-x:auto;">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <?php foreach ($columns as $col) echo "<th>".strtoupper(str_replace('_',' ',$col))."</th>"; ?>
                            <th>AKSI</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $r = $DB->query("SELECT * FROM $tabel_aktif ORDER BY $primaryKey DESC");
                        $no = 1;
                        while ($d = $r->fetch_assoc()) {
                            echo "<tr><td>".$no++."</td>";
                            foreach ($columns as $col) {
                                if(strpos($col, 'foto') !== false && !empty($d[$col])) 
                                    echo "<td><img src='uploads/{$d[$col]}' class='preview'></td>";
                                elseif($col == 'lagu' && !empty($d[$col]))
                                    echo "<td>🎵 Ada</td>";
                                else 
                                    echo "<td>".(strlen($d[$col])>30 ? substr($d[$col],0,30)."..." : $d[$col])."</td>";
                            }
                            echo "<td>
                                <a href='?tabel=$tabel_aktif&op=edit&id={$d[$primaryKey]}'>Edit</a> | 
                                <a href='?tabel=$tabel_aktif&op=hapus&id={$d[$primaryKey]}' onclick='return confirm(\"Hapus?\")'>Hapus</a>
                            </td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>