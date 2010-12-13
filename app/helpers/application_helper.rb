module ApplicationHelper
  def botao_curti(evento)
    url = url_for(:action => :show , :id => evento.id,:only_path => false)
    raw '<iframe src="http://www.facebook.com/plugins/like.php?href=' << url << '&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow: visible;width:450px; height:20px;" allowTransparency="true"></iframe>'
  end
  def botao_twitter(evento)
    url = url_for(:action => :show , :id => evento.id,:only_path => false)
    raw '<iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://platform.twitter.com/widgets/tweet_button.html?url=' << url << '&text=Eu vou no ' << evento.nome << ' no ' << evento.local << ' , que mais vai?&count=none&via=socialspot" style="width:130px; height:25px;"></iframe>'
  end
  def botao_orkut(evento)
    url = url_for(:action => :show , :id => evento.id,:only_path => false)
    raw '<div id="orkut-button"></div>
     <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">' << "google.load('orkut.share', '1');
      google.setOnLoadCallback(function() {
        new google.orkut.share.Button({
          lang: 'en',
          style: google.orkut.share.Button.STYLE_REGULAR,
          title: '#{evento.nome}',
          thumbnail: '#{evento.image}',
          summary: ('#{evento.tipo + ' no '+ evento.local}'),
          destination: '#{url}'
        }).draw('orkut-button');
      });
    </script>"    
  end
end
