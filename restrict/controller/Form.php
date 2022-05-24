<?php
class Form
{
  private $message = "";
  private $error = "";
  public function __construct()
  {
    Transaction::open();
  }
  public function controller()
  {
    $form = new Template("view/form.html");
    $form->set("id", "");
    $form->set("tarefa", "");
    $form->set("data", "");
    $form->set("horario", "");
    $this->message = $form->saida();
  }
  public function salvar()
  {
    if (isset($_POST["tarefa"]) && isset($_POST["data"]) && isset($_POST["horario"])) {
      try {
        $conexao = Transaction::get();
        $agenda = new Crud("agenda");
        $tarefa = $conexao->quote($_POST["tarefa"]);
        $data = $conexao->quote($_POST["data"]);
        $horario = $conexao->quote($_POST["horario"]);
        if (empty($_POST["id"])) {
          $agenda->insert(
            "tarefa, data, horario",
            "$tarefa, $data, $horario"
          );
        } else {
          $id = $conexao->quote($_POST["id"]);
          $agenda->update(
            "tarefa = $tarefa, data = $data, horario = $horario",
            "id = $id"
          );
        }
        $this->message = $agenda->getMessage();
        $this->error = $agenda->getError();
      } catch (Exception $e) {
        $this->message = $e->getMessage();
        $this->error = true;
      }
    } else {
      $this->message = "Campos não informados!";
      $this->error = true;
    }
  }
  public function editar()
  {
    if (isset($_GET["id"])) {
      try {
        $conexao = Transaction::get();
        $id = $conexao->quote($_GET["id"]);
        $agenda = new Crud("agenda");
        $resultado = $agenda->select("*", "id = $id");
        if (!$agenda->getError()) {
          $form = new Template("view/form.html");
          foreach ($resultado[0] as $cod => $horario) {
            $form->set($cod, $horario);
          }
          $this->message = $form->saida();
        } else {
          $this->message = $agenda->getMessage();
          $this->error = true;
        }
      } catch (Exception $e) {
        $this->message = $e->getMessage();
        $this->error = true;
      }
    }
  }
  public function getMessage()
  {
    if (is_string($this->error)) {
      return $this->message;
    } else {
      $msg = new Template("view/msg.html");
      if ($this->error) {
        $msg->set("cor", "danger");
      } else {
        $msg->set("cor", "success");
      }
      $msg->set("msg", $this->message);
      $msg->set("uri", "?class=Tabela");
      return $msg->saida();
    }
  }
  public function __destruct()
  {
    Transaction::close();
  }
}