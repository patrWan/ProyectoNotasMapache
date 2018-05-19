package controller;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.xml.bind.v2.runtime.output.NamespaceContextImpl;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Alumno;

/**
 *
 * @author Diego
 */
@WebServlet(name = "GenerarPDFServlet", urlPatterns = {"/generarPDF.do"})
public class GenerarPDFServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        try {
            try {
                
                String rut = request.getParameter("txtRut");
                String nombre = request.getParameter("txtNombre");
                String ape = request.getParameter("txtApe");
                
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                Paragraph par1 = new Paragraph();
                Font fonTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLACK);
                par1.add(new Phrase("Certificado Alumno Regular", fonTitulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);

                Paragraph par2 = new Paragraph();
                Font fonDescr = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
                par2.add(new Paragraph(Chunk.NEWLINE));
                par2.add(new Phrase(Chunk.NEWLINE));
                par2.add(new Phrase(Chunk.NEWLINE));
                par2.add(new Phrase("La Secretaria General del Instituto Profesional Mapache, sede Rancagua, inscrita en el\n"
                        + "Folio C-22 del registro de Institutos Profesionales del Ministerio de Educación, autónoma\n"
                        + "según Acuerdo N°160/2000 del Consejo Superior de Educación.", fonDescr));
                par2.setAlignment(Element.ALIGN_CENTER);
                documento.add(par2);

                Paragraph par3 = new Paragraph();
                Font fonDescr2 = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
                par3.add(new Paragraph(Chunk.NEWLINE));
                par3.add(new Phrase(Chunk.NEWLINE));
                par3.add(new Phrase(Chunk.NEWLINE));
                par3.add(new Phrase("Alumno : " + nombre + " " + ape, fonDescr2));
                par3.setAlignment(Element.ALIGN_CENTER);
                documento.add(par3);

                Paragraph par4 = new Paragraph();
                Font fonDescr3 = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
                par4.add(new Paragraph(Chunk.NEWLINE));
                par4.add(new Phrase("RUT : " + rut, fonDescr3));
                par4.setAlignment(Element.ALIGN_CENTER);
                documento.add(par4);

                Paragraph par5 = new Paragraph();
                Font fonDescr4 = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
                par5.add(new Paragraph(Chunk.NEWLINE));
                par5.add(new Paragraph(Chunk.NEWLINE));
                par5.add(new Paragraph(Chunk.NEWLINE));
                par5.add(new Phrase("Es alumno(a) regular en el periodo 2018\n"
                        + "Se otorga el presente certificado a petición del interesado con el objetivo de\n"
                        + "LOS FINES QUE ESTIME PERTINENTES", fonDescr4));
                par5.setAlignment(Element.ALIGN_CENTER);
                documento.add(par5);

                documento.close();

            } catch (Exception ex) {
                ex.getMessage();
            }
        } finally {
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
