/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * ContactPanel.java
 *
 * Created on 2008-12-14, 01:38:34
 */

package gui.main.contact_partial;
//import javax.swing.tree.TreeCellRenderer;

/**
 *
 * @author comboy
 */
public class ContactPartialPanel extends javax.swing.JPanel{

    //DefaultTreeCellRenderer defaultRenderer = new DefaultTreeCellRenderer();

    /** Creates new form ContactPanel */
    public ContactPartialPanel() {
        initComponents();
    }

    public void dispose() {
    //    a = Color.lightGray;

    }

//    public Component[] getComponents() {
//        return [];
//    }


    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
  // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
  private void initComponents() {

    name_label = new javax.swing.JLabel();

    setBackground(new java.awt.Color(255, 255, 255));
    setAutoscrolls(true);

    name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png"))); // NOI18N
    name_label.setText("jLabel1");

    javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
    this.setLayout(layout);
    layout.setHorizontalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addComponent(name_label, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
    );
    layout.setVerticalGroup(
      layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
      .addComponent(name_label, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 29, Short.MAX_VALUE)
    );
  }// </editor-fold>//GEN-END:initComponents


  // Variables declaration - do not modify//GEN-BEGIN:variables
  private javax.swing.JLabel name_label;
  // End of variables declaration//GEN-END:variables

  /*
    public Component getTreeCellRendererComponent(JTree tree, Object value, boolean selected, boolean expanded, boolean leaf, int row, boolean hasFocus) {
        //throw new UnsupportedOperationException("Not supported yet.");
        if (!leaf) {
            return defaultRenderer.getTreeCellRendererComponent(tree, value, selected, expanded,
            leaf, row, hasFocus);
        }
        return this;
    }
   */

}
