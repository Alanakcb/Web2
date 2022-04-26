<?php
class Form
{
  private $message = "";
  public function __construct()
  {
    Transaction::open();
  }
  public function controller()
  {
    $form = new Template("view/form.html");
    $this->message = $form->saida();
  }
  public function salvar()
  {
    if(isset($_POST["tarefa"]) && isset($_POST["data"]) && isset($_POST["horario"])){
      try {
        $conexao = Transaction::get();
        $agenda = new Crud("agenda");
        $tarefa = $conexao->quote($_POST["tarefa"]);
        $data = $conexao->quote($_POST["data"]);
        $horario = $conexao->quote($_POST["horario"]);
        $resultado = $agenda->insert("tarefa, data, horario", "$tarefa, $data, $horario");
      } catch (Exception $e) {
        echo $e->getMessage();
      }
    }
  }
  public function getMessage()
  {
    return $this->message;
  }
  public function __destruct()
  {
    Transaction::close();
  }
}