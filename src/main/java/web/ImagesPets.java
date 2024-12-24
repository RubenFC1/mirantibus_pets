package web;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class ImagesPets {
    private final String pathFiles = "C:\\MirantibusPets2\\MirantibusPets\\src\\main\\webapp\\public\\uploadsPets\\";
    private final File uploads = new File(pathFiles);
    private final String[] extensions = {".ico", ".png", ".jpg", ".jpeg"};
    private String extension;

    public String savePet(Part part, String id, String idPet) throws IOException {
        if (part == null) {
            System.out.println("No ha seleccionado un archivo");
            return "fotoPerdida.jpg";
        }

        if (isExtension(part.getSubmittedFileName(), extensions)) {
            return saveFile(part, uploads, id, idPet);
        }
        return "fotoPerdida.jpg";
    }


    private String saveFile(Part part, File pathUploads, String id, String idPet) throws IOException {
        String name = id + part.getSubmittedFileName();
        InputStream inputStream = part.getInputStream();
        if (inputStream != null) {
            File file = new File(pathUploads, name);
            Files.copy(inputStream, file.toPath());
        }
        return name;
    }

    private boolean isExtension(String fileName, String[] extensions) {
        for (String extension : extensions) {
            if (fileName.toLowerCase().endsWith(extension)) {
                this.extension = extension;
                return true;
            }
        }
        return false;
    }
}