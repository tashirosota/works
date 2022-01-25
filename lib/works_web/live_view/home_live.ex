defmodule WorksWeb.LiveView.HomeLive do
  use WorksWeb, :live_view

  def render(assigns) do
    ~L"""
    <div style="background: #073642; min-height: 1000px;">
      <img style="width: 200px; border-radius: 150px; margin: auto; padding-top: 20px;" src="https://pbs.twimg.com/profile_images/1458088554123436032/3xBmpX_y.jpg"/>
      <h1 style="display: block; width: fit-content; margin: auto; font-size: 30px; color: #93a1a1">Sota Tashiro</h1>
      <h2 style="display: block; width: fit-content; margin: auto; font-size: 20px; color: #859900;">Welcome to my portfolio.</h2>
      <h3 style="display: block; width: fit-content; margin: auto; font-size: 15px; color: #93a1a1; text-align: center;">
        <p>♥I love Elixir, Ruby, SQL, Music and Beer🍻</p>
        <p>Software engineer and drummer.</p>
        <p>I'm interested mainly in functional programming, distributed systems and process.</p>
        <p style="color: #859900; margin-top: 5px;">Works.</p>
        <ul>
          <li>~ 2022/1 at <a href="https://taskey.co.jp" style="color: #2aa198">taskey</a></li>
          <li>2022/2 ~ at <a href="https://mixi.co.jp" style="color: #2aa198">mixi</a></li>
        </ul>
        <p style="color: #859900; margin-top: 5px;">Drums.</p>
        <ul>
          <li>~ 2018/9 at <a href="http://kotori-band.com/" style="color: #2aa198">KOTORI</a></li>
          <li>2018/10 ~ at <a href="http://soshaku.wp.xdomain.jp/" style="color: #2aa198">soshaku</a></li>
          <li>2019/1 ~ at <a href="https://somedaysgone.com/" style="color: #2aa198">Someday's Gone</a></li>
        </ul>
        <p style="margin-top: 5px;">You can see activities other than work in recent years if you press the button below</p>
      </h3>
      <br/>
      <button phx-click="oss" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">OSS</button>
      <button phx-click="article" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">Article</button>
      <button phx-click="music" style="display: block; margin: 10px auto; width: 200px; color: #073642; font-size: 25px" class="bg-green-500 hover:bg-green-400 font-bold border-b-4 border-green-700 hover:border-green-500 rounded">Music</button>
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
          <img src="images/amazon.png" style="width: 50px;"/>
          <a href="https://www.amazon.co.jp/hz/wishlist/ls/1J48QWKARYBBL" style="color: #b58900; margin-left: 5px" target="_blank">Wish list</a>
        </li>
      </ul>
    </div>
    """
  end

  def mount(_session, _params, socket) do
    {:ok, assign(socket, :open_source_softweres, [])}
    {:ok, assign(socket, :articles, [])}
    {:ok, assign(socket, :musics, [])}
  end

  def handle_event("oss", _, socket) do
    {:noreply, update(socket, :open_source_softweres, &(&1 ++ [%{}]))}
  end

  def handle_event("article", _, socket) do
    {:noreply, update(socket, :articles, &(&1 ++ [%{}]))}
  end

  def handle_event("music", _, socket) do
    {:noreply, update(socket, :musics, &(&1 ++ [%{}]))}
  end
end
