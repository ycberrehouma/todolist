<?php

namespace AppBundle\Controller;


use AppBundle\Entity\Todo;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;




class TodoController extends Controller
{
    /**
     * @Route("/", name="todo_list")
     */
    public function listAction()
    {
      

        $todos = $this->getDoctrine()
            ->getRepository('AppBundle:Todo')
            ->findAll();


        return $this->render('todos/index.html.twig', array(
            'todos' => $todos
        ));
    }
    /**
     * @Route("/todos/create", name="todo_create")
     */
    public function createAction(Request $request)
    {
        $todo = new Todo;

       $form = $this->createFormBuilder($todo)
           ->add('name',TextType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
           ->add('category',TextType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
        ->add('description',TextareaType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
        ->add('priority',ChoiceType::class,array('choices'=>array('Low'=>'Low','Normal'=>'Normal','High'=>'High'),'attr' =>array
        ('class'=>'form-control','style'=>'margin-bottom:15px')))
        ->add('due_date',DateTimeType::class,array('attr' =>array('class'=>'formcontrol','style'=>'margin-bottom:15px')))
           ->add('Save',SubmitType::class,array('label'=>'Create Todo','attr' =>array('class'=>'btn btn-primary','style'=>'margin-bottom:15px')))
           ->getForm();

$form->handleRequest($request);

if($form->isSubmitted() && $form->isValid()){
    //Get Data
    $name=$form['name']->getData();
    $category=$form['category']->getData();
    $description=$form['description']->getData();
    $priority=$form['priority']->getData();
    $due_date=$form['due_date']->getData();

    $now = new\DateTime('now');

    $todo->setName($name);
    $todo->setCategory($category);
    $todo->setDescription($description);
    $todo->setPriority($priority);
    $todo->setDueDate($due_date);
    $todo->setCreateDate($now);

    $em = $this->getDoctrine()->getManager();

    $em->persist($todo);
    $em->flush();

    $this->addFlash(
        'notice',
        'Todo Added'
    );

    return $this->redirectToRoute('todo_list');
}

        return $this->render('todos/create.html.twig', array('form' => $form -> createView()));
    }
    /**
     * @Route("/todos/edit/{id}", name="todo_edit")
     */
    public function editAction($id, Request $request)
    {

        $todo = $this->getDoctrine()
            ->getRepository('AppBundle:Todo')
            ->find($id);
        $now = new\DateTime('now');

        $todo->setName($todo->getName());
        $todo->setCategory($todo->getCategory());
        $todo->setDescription($todo->getDescription());
        $todo->setPriority($todo->getPriority());
        $todo->setDueDate($todo->getDuedate());
        $todo->setCreateDate($now);


        $form = $this->createFormBuilder($todo)
            ->add('name',TextType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
            ->add('category',TextType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
            ->add('description',TextareaType::class,array('attr' =>array('class'=>'form-control','style'=>'margin-bottom:15px')))
            ->add('priority',ChoiceType::class,array('choices'=>array('Low'=>'Low','Normal'=>'Normal','High'=>'High'),'attr' =>array
            ('class'=>'form-control','style'=>'margin-bottom:15px')))
            ->add('due_date',DateTimeType::class,array('attr' =>array('class'=>'formcontrol','style'=>'margin-bottom:15px')))
            ->add('Save',SubmitType::class,array('label'=>'Update Todo','attr' =>array('class'=>'btn btn-primary','style'=>'margin-bottom:15px')))
            ->getForm();

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            //Get Data
            $name=$form['name']->getData();
            $category=$form['category']->getData();
            $description=$form['description']->getData();
            $priority=$form['priority']->getData();
            $due_date=$form['due_date']->getData();


            $em = $this->getDoctrine()->getManager();
            $todo = $em->getRepository('AppBundle:Todo')->find($id);

            $todo->setName($name);
            $todo->setCategory($category);
            $todo->setDescription($description);
            $todo->setPriority($priority);
            $todo->setDueDate($due_date);
            $todo->setCreateDate($now);


            $em->flush();

            $this->addFlash(
                'notice',
                'Todo Updated'
            );

            return $this->redirectToRoute('todo_list');
        }

        return $this->render('todos/edit.html.twig',array(
            'todos' => $todo,
            'form' => $form->createView()
        ));
    }
    /**
     * @Route("/todos/details/{id}", name="todo_details")
     */
    public function detailsAction($id)
    {
        $todo = $this->getDoctrine()
            ->getRepository('AppBundle:Todo')
            ->find($id);

        return $this->render('todos/details.html.twig',array('todos' => $todo
      ));
    }

    /**
     * @Route("/todos/delete/{id}", name="todo_delete")
     */
    public function deletesAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $todo = $em->getRepository('AppBundle:Todo')->find($id);

        $em->remove($todo);
        $em->flush();

        $this->addFlash(
            'notice',
            'Todo Removed');

        return $this->redirectToRoute('todo_list');



}
    /**
     * @Route("/t", name="todo_del")
     */
    public function listtAction()
    {

            if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
            {
                $ip=$_SERVER['HTTP_CLIENT_IP'];
            }
            elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
            {
                $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
            }
            else
            {
                $ip=$_SERVER['REMOTE_ADDR'];
            }
            echo $ip;
        return $this->render('todos/indexx.html.twig');
        }


}
