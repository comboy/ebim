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

    setBackground(null);
    setAutoscrolls(true);
    setPreferredSize(null);

    name_label.setBackground(null);
    name_label.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gui/images/status/available.png"))); // NOI18N
    name_label.setText("jLabel1");
    name_label.setMaximumSize(null);
    name_label.setMinimumSize(null);
    name_label.setPreferredSize(null);

    org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
    this.setLayout(layout);
    layout.setHorizontalGroup(
      layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
      .add(name_label, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
    );
    layout.setVerticalGroup(
      layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
      .add(name_label, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
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
