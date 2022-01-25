defmodule WorksWeb.LiveView.HomeLive do
  use WorksWeb, :live_view
  alias Works.DynamoDb.{OpenSourceSoftweres, Articles, Musics}

  def render(assigns) do
    ~L"""
    <div>
      <img style="width: 200px; border-radius: 150px; margin: auto; padding-top: 20px;" src="https://pbs.twimg.com/profile_images/1458088554123436032/3xBmpX_y.jpg"/>
      <h1 style="display: block; width: fit-content; margin: auto; font-size: 30px;">Sota Tashiro</h1>
      <h2 style="display: block; width: fit-content; margin: auto; font-size: 20px; color: #859900;">Welcome to my portfolio.</h2>
      <h3 style="display: block; width: fit-content; margin: auto; font-size: 15px; text-align: center;">
        <p>Software engineer and drummer.</p>
        <p>♥I love Elixir, Ruby, SQL, Music and Beer🍻</p>
        <p>I'm interested mainly in functional programming, distributed systems and process.</p>
        <p style="color: #859900; margin-top: 5px;">Works.</p>
        <ul>
          <li>~ 2022/01 at <a href="https://taskey.co.jp" target="_blank" style="color: #2aa198">taskey</a></li>
          <li>2022/02 ~ at <a href="https://mixi.co.jp" target="_blank" style="color: #2aa198">mixi</a></li>
        </ul>
        <p style="color: #859900; margin-top: 5px;">Drums.</p>
        <ul>
          <li>~ 2018/09 at <a href="http://kotori-band.com/" target="_blank" style="color: #2aa198">KOTORI</a></li>
          <li>2018/10 ~ at <a href="http://soshaku.wp.xdomain.jp/" target="_blank" style="color: #2aa198">soshaku</a></li>
          <li>2019/01 ~ at <a href="https://somedaysgone.com/" target="_blank" style="color: #2aa198">Someday's Gone</a></li>
        </ul>
        <p style="margin-top: 5px;">You can see activities other than work in recent years if you press the button below</p>
      </h3>
      <br/>
      <button phx-click="oss" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">OSS</button>
      <%=if(@open_source_softweres |> RUtils.present?) do%>
        <div style="max-height: 300px; overflow-y: auto; max-width: 600px; margin: auto; padding: 0px 20px;">
          <%=@open_source_softweres |> REnum.map(fn el ->%>
            <a href="<%=el.url%>" target="_blank" style="display: block; margin: auto; border: #657b83 solid 1px; margin-top: 5px; padding: 3px; position: relative;">
              <div style="font-weight: bold; border-bottom: #2aa198 solid 1px"><%= el.title %></div>
              <p style="color: #657b83; font-size: 15px;"><%= el.description %></p>
              <img src="images/url.png" style="width: 15px; position: absolute; right: 5px; bottom: 5px;"/>
            </a>
          <%end)%>
        </div>
      <%end%>
      <button phx-click="article" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">Article</button>
      <%=if(@articles |> RUtils.present?) do%>
        <div style="max-height: 300px; overflow-y: auto; max-width: 600px; margin: auto; padding: 0px 20px;">
          <%=@articles |> REnum.map(fn el ->%>
            <a href="<%=el.url%>" target="_blank" style="display: block; margin: auto; border: #657b83 solid 1px; margin-top: 5px; padding: 3px; position: relative;">
              <div style="font-weight: bold; border-bottom: #2aa198 solid 1px"><%= el.title %></div>
              <p style="color: #657b83; font-size: 15px;"><%= el.description %></p>
              <img src="images/url.png" style="width: 15px; position: absolute; right: 5px; bottom: 5px;"/>
            </a>
          <%end)%>
        </div>
      <%end%>
      <button phx-click="music" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">Music</button>
      <%=if(@musics |> RUtils.present?) do%>
        <div style="max-height: 300px; overflow-y: auto; max-width: 600px; margin: auto; padding: 0px 20px;">
          <%=@musics |> REnum.map(fn el ->%>
            <a href="<%=el.url%>" target="_blank" style="display: block; margin: auto; border: #657b83 solid 1px; margin-top: 5px; padding: 3px; position: relative;">
              <div style="font-weight: bold; border-bottom: #2aa198 solid 1px"><%= el.title %></div>
              <p style="color: #657b83; font-size: 15px;"><%= el.description %></p>
              <img src="images/url.png" style="width: 15px; position: absolute; right: 5px; bottom: 5px;"/>
            </a>
          <%end)%>
        </div>
      <%end%>

      <ul style="font-size: 15px; margin-top: 30px" class="font-bold">
        <li style="display: block; margin: 10px auto; width: fit-content; display: flex;">
          <img src="images/mail.png" style="width: 20px;"/>
          <a href="mailto:g4160hc@gmail.com" style="color: #657b83; margin-left: 5px" target="_blank">contact me</a>
        </li>
        <li style="display: block; margin: 10px auto; width: fit-content; display: flex;">
          <img src="images/twitter.png" style="width: 23px;"/>
          <a href="https://twitter.com/tashiro_web" style="color: #657b83; margin-left: 5px" target="_blank">@tashiro_web</a>
        </li>
        <li style="display: block; margin: 10px auto; width: fit-content; display: flex;">
          <img src="images/github.png" style="width: 23px;"/>
          <a href="https://github.com/tashirosota" style="color: #657b83; margin-left: 5px" target="_blank">@tashirosota</a>
        </li>
        <li style="display: block; margin: 10px auto; width: fit-content; display: flex;">
          <img src="images/instagram.png" style="width: 23px;"/>
          <a href="https://www.instagram.com/sotashiro" style="color: #657b83; margin-left: 5px" target="_blank">@sotashiro</a>
        </li>
        <li style="display: block; margin: 10px auto; width: fit-content; display: flex;">
          <a href="https://www.amazon.co.jp/hz/wishlist/ls/1J48QWKARYBBL" style="color: #b58900;" target="_blank">Wish list</a>
          <img src="images/amazon.png" style="width: 40px;"/>
        </li>
      </ul>
    </div>
    """
  end

  def mount(_session, _params, socket) do
    {
      :ok,
      assign(socket, %{open_source_softweres: [], articles: [], musics: []})
    }
  end

  def handle_event("oss", _, socket) do
    func = fn before ->
      if(before |> RUtils.present?()) do
        []
      else
        OpenSourceSoftweres.all()
      end
    end

    {:noreply, update(socket, :open_source_softweres, func)}
  end

  def handle_event("article", _, socket) do
    func = fn before ->
      if(before |> RUtils.present?()) do
        []
      else
        Articles.all()
      end
    end

    {:noreply, update(socket, :articles, func)}
  end

  def handle_event("music", _, socket) do
    func = fn before ->
      if(before |> RUtils.present?()) do
        []
      else
        Musics.all()
      end
    end

    {:noreply, update(socket, :musics, func)}
  end
end
