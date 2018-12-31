<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * DefaultController.
 *
 * @Route("/", name="default.")
 */
class DefaultController extends AbstractController
{
    /**
     * Matches / exactly
     *
     * @Route("/", name="homepage")
     */
    public function index()
    {
        return $this->render('default/index.html.twig', []);
    }
}
