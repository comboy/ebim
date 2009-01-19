class PreferencesController < ApplicationController
  set_model 'PreferencesModel'
  set_view 'PreferencesView'
  set_close_action :close

  def button_save_action_performed
    update_model(view_state.model,:jid,:password)
    config = Ebim::Base.instance.config
    config[:jid] = model.jid
    config[:password] = model.password
    close
  end

  def combo_box_skin_action_performed
    update_model(view_state.model,:skin)
    puts "selected skin: #{model.skin}"
    javax.swing.UIManager.set_look_and_feel("org.jvnet.substance.skin.Substance#{model.skin}LookAndFeel") if model.skin && !model.skin.empty?
    puts javax.swing.UIManager.getInstalledLookAndFeels.map;
    begin

    # XXX what if some ether windows are opened?
    javax.swing.SwingUtilities.updateComponentTreeUI(MainView.java_window);
    signal :repaint

    rescue Exception => ex
      puts "tu jest sraka #{ex}"
    end
  end
end
