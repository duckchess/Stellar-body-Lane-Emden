#import "verma.typ": *
#import "theorems.typ": *
#set math.equation(numbering: "(1.1)")

#show: evan.with(
  title: [A pedagogical review and worked derivation of the Lane-Emden equation, including an independent variational rederivation and a numerical comparison to the Model S solar model
],
  subtitle: "",
  author: "Arush Datta",
  date: datetime.today(),
  report-style: true,
)

#pagebreak()

#toc

#pagebreak()

= Derivation of the Lane-Emden from First Principles

In order to introduce the nature of the Lane-Emden Equation (LEE), it is useful to first understand the derivation and the assumptions taken during the process.


== Assumptions
To begin, we can assume that there is a non-rotating stationary/static spherical body of radius $R$ mass $M$. It has a variable density which is characterized by a function $rho=rho(X_i)$, specified by some arbitrary variables $X_i$. Similarly, the mass it contains at a certain point by some arbitrary variables is defined as $M = M(X_i)$. $X_i$ denotes the variables which the functional depends on. Additionally, the matter of the spherical body is considered to be a continuous, non-compressible fluid such that the functionals we have defined are continuous and differentiable.  
\
These are some facts which arise from combining the above assumptions.
\
1. Density $rho$ is a function of radius $r$ only: $rho = rho (r)$
2. Mass $M$ is a function of radius $r$ only: $M = M(r)$
3. Only the inner mass contributes to the gravitational force.
The above are implications which arise from Shell Theorem. 

On a general note, the above assumptions removes complexities which may lead to more complex but more accurate models. 

In order to keep simplicity, Newtonian gravitation is employed. 
$
  F_(12) = (G M_1 M_2)/r_(12)^2
$
The more useful form for our derivation is the differential form:
$
  d F_(12) = (G M_1 )/r_(12)^2 d M_2
$

Very importantly, we are ignoring any relativistic effects that the Stellar body may have. 

Additionally we will consider a thin shell during the computation. This will allow us to make the following assumptions:
1. Higher orders of differentials (like $(d r)^2$) can be ignored.
2. Change of pressure from $P(r)$ to $P(r+d r)$ can approximated as $P(r)$ to $P(r)+d P$.
3. Density is constant across the thin shell.

Additionally, Stellar body processes like nuclear reactions, which certainly do contribute to the factors pertaining to Stellar bodies. Later on, we will discuss that trying to include this factor does lead to more accurate results. In the next section, we discuss the derivation of the hydrostatic equilibrium equation, which can be considered to be the very base of the LEE. 

#pagebreak()

== Hydrostatic Equilibrium

We can deduce that at some arbitrary thin shell of a spherical body, the pressure and gravity due to the inner mass must be in equilibrium at every point, as the stellar body itself is in equilibrium. The mathematical statement of this is the hydrostatic equilibrium equation. 

Assume that at a radius of $r$ from the center,  there is a thin shell of radius $d r$. The thin shell has some pressure on it in its inner surface $P_(text("in")) = P(r)$ and some pressure on its outer surface $P_text("out")= P(r)+d P$.


#align(center)[
  #image("assets/image-19.png", width: 400pt)]


The area on which these pressures act on are $A_text("in")= 4 pi r^2$ and $A_text("out")=4 pi (r+d r)^2$ respectively.
Thus we find:
$
  F_text("in")= P_text("in") A_text("in") = P(r) (4 pi r^2)
$<fi>

$
  F_text("out")= P_text("out") A_text("out") = (P(r)+d P)[4 pi (r+d r)^2] = 4 pi [r^2P(r)+2r d r P(r)+(d r)^2P(r) \
    +r^2 d P(r)+2r d r d P(r)+(d r)^2 d P(r)]
$

We can ignore the higher order of differentials which includes 2nd and 3rd order terms like $d r d P(r), (d r)^2 text("and") (d r)^2 d P$ which do not contribute to the force on the same order as the 1st order. 
$
  F_text("out") approx 4 pi r^2 P(r)+ 4 pi r^2 d P(r)
$<fo>

In order to find the force due to gravity, we can use the differential form of Newton's law of gravitation:
$
  d F_g = (G M(r) d M)/(r^2)
$<grav>

Here $F_g$ is the force due to gravity, $G$ is the gravitational constant where $G = 6.6743 times 10-11 m^3 k g^(-1) s^(-2)$, $d m$ is the mass of the thin shell and $r$ is the radius from the center of the stellar body.

We know that:
$
  rho(r) = (d M)/(d V)
$<shellvol>
where $rho$ is the density which is a function of radius $r$ only, $d m$ is the mass of the thin shell, $d V$ is the thin volume of the shell. It is quite evident that:
$
  d V = d(4/3 pi r^3) = 4 pi r^2 d r
$<dV>
Using @dV in @shellvol, we can obtain:
$
  d M = 4 pi r^2 rho(r) d r
$<dM>
Using @dM in @grav we further get:
$
  d F_g = 4 pi G M(r) rho(r)d r
$<dF>
We invoke the condition that the stellar body is in equilibrium, thus the sum of all forces must be equal to $0$.
$
  sum_i arrow(F)_i = 0
$
Considering that any vector going radially inwards is assigned a negative sign. We only have the following forces assuming that there is no rotational forces as well, considering that the body is not spinning.
$
  F_text("out")-F_text("in")-d F_g = 0
$
We can write each term using @fi, @fo, @dF:
$
  4 pi r^2 P(r)+ 4 pi r^2 d P(r) - (4 pi r^2 P(r)) - (4 pi G M(r) rho(r)d r) = 0
$
Rearranging the terms we obtain:
$
  -(d P(r))/(d r) = (G M(r) rho(r))/r^2
$<Hysa>

Additionally using @dM, we can rearrange to obtain a differential equation which describes how the mass changes with respect to radius.
$
  (d M)/(d r)= 4 pi r^2 rho(r)
$<dmdr>

== Polytropic Equation of State

$
  P V^gamma = text("constant")
$<pvg>

This is a result that is derived from thermodynamics, assuming that there is an adiabatic condition (). We will apply this condition to our stellar body. The interesting part is how even though the equation is simple, it does tend to resemble real-life stellar masses for specific values of $gamma$. It has been found that for $gamma = 4/3$ it actually corresponds to something called the "Eddington Standard Model", which is closely related to describing a star in radiative equilibrium @Collins1989. Perhaps more interestingly, for $gamma = 5/3$, it can describe (although crudely) a white dwarf.
It may be evident that these values of $gamma$ are a little strange to work with so we will introduce a number called polytropic index $n$. Such that $gamma = 1+ 1/n$.

== Lane Emden Equation

Now that we have found the necessary equations needed to describe our system cleanly, we can derive something called the Lane-Emden Equation @Lane1870 @Emden1907. This is quite a famous equation as it is one of the rare cases where an analytical solution can be found for a stellar body. Starting with @Hysa:
$
  -(d P(r))/(d r) = (G M(r) rho(r))/r^2
$
We can rearrange it as follows:
$
  r^2/rho(r) (d P(r))/(d r) = - G M(r)
$
Differentiating with respect to $r$:
$
  d/(d r)(r^2/rho(r) (d P(r))/(d r)) = - G (d M(r))/(d r)
$<18>
We can use @dmdr in @18 and rearrange:
$
  1/r^2 d/(d r)(r^2/rho(r) (d P(r))/(d r)) = -4 pi G rho(r)
$<19>
Now for the interesting part, the above equation can be simplified in an extremely smart manner, we will introduce dimensionless variables $theta$ and $xi$:
$
  rho(r) equiv rho_c theta^n
$<rot>
$
  r equiv alpha xi
$<rxi>
Here $theta$ varies between 0 and 1: $0<=theta<=1$, Additionally, $rho_c$ is initially just a constant variable, however, it is found that this is actually the central density of the star, $alpha$ is a variable which will be chosen in order to simplify the equation further.

We can differentiate two above equations implicitly to obtain:
$
  d rho = rho_c n theta^(n-1) d theta, quad d r = alpha d xi
$
Dividing both we can obtain:
$
  (d rho)/(d r) =(rho_c n theta^(n-1))/alpha (d theta)/(d xi)
$<drodr>
In @19, we can use the polytropic EOS @pvg to obtain:
$
  1/r^2 d/(d r)(r^2/rho(r) (d(K rho^gamma))/(d r)) = -4 pi G rho(r)
$
$
  1/r^2 d/(d r)((K r^2 gamma rho^(gamma-1))/(rho(r)) (d rho)/(d r)) = -4 pi G rho(r)
$
We can now use @drodr, @rot and @rxi to write:
$
  1/(alpha^2 xi^2 )d/(d xi)[(K alpha^2 xi^2 gamma rho_c^(gamma-1) theta^(n(gamma-1)))/(rho_c theta^n)((rho_c n theta^(n-1))/alpha^2 (d theta)/(d xi))] = -4 pi G rho_c theta^n
$
We can simplify the equation also using the relation $gamma = 1+1/n$ in order to obtain:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -alpha^2[(4 pi G rho_c)/(K (n+1) rho_c^(1/n))] theta^n
$
We chose $alpha$ as:
$
  alpha equiv [(K (n+1) rho^(1/n))/(4 pi G rho_c)]^(1/2)
$
Thus we can obtain the final equation:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -theta^n
$
This is called the Lane-Emden Equation.

== Boundary Conditions

In order to solve this 2nd order differential equation, we will require some boundary conditions such that they make physical sense. The most commonly used boundary conditions use the following ideas:

1. The density of the matter of the star at its outer surface must be 0. \
2. At the center of the star, the pressure gradient goes to 0 (imagining the pressure gradient as a vector, at the center there is no vector as there is an equal pressure gradient from all directions due to the symmetry of the system.)
3. At the center of the star, there is a central density $rho_c$.

Each of these statements are valid on our physical system, thus are valid boundary conditions. We can now rewrite these as mathematical statements respectively
1. At the outer surface of the star $xi_1$, $theta(xi_1)=0$.
2. At center of the star $xi=0$, $(d theta)/(d xi)=0$.
3. At the center of the star $rho = rho_c$, from @rot we obtain: $theta(0)=1$.

As this is a 2nd order ODE, two boundary conditions are required to determine a unique solution. Condition 2 and 3 are the natural choices as they both specify the condition at the center of the star, whereas condition 1 emerges from the solution itself.

#pagebreak()

= Derivation of Lane-Emden from Variation of Energy Principle

In the section before, we had used Newtonian mechanics in order to obtain an equation which describes the stellar body. This is a direct and physically intuitive derivation of the Lane-Emden equation. However, in this section, we will try to obtain the Lane-Emden using a more Lagrangian framework @Fronsdal2014. In the Newtonian framework we justify stability of stellar bodies using force analysis. In the Lagrangian framework, we will justify the stability of the stellar body by assuming that the star would be at the minima of its total energy of the stellar system. Both analysis are correct, however the Lagrangian framework guarantees that the stellar body has stability in terms of its energy as any small perturbations in energy due to any displacements will still guarantee stability and the system returns to equilibrium. In a force balancing model, there is no such guarantee, it could be a saddle point or even a maximum. Additionally, this confirms that the Lane-Emden is a fundamentally physical description.

== Energy of the System

The total energy of the system comes from two sources: the gravitational energy and the thermal energy contained in the system. We write:
$
  E_text("total") = E_text("gravitation")+E_text("thermal")
$
In order to determine the total energy, we need to write appropriate relations for $E_text("gravitation")$ and $E_text("thermal")$ for our system. We know the contribution of change in gravitational potential for Newtonian gravitation for each spherical shell to be:
$
  d U_text("gravitation") = - (G M)/r d M
$
Considering each spherical shell we obtain the energy contributed by gravity:
$
  E_text("gravitation")= -integral_0^R (G M)/r d M
$
$R$ denotes the radius of the spherical stellar body. Writing in a more useful form and using @dmdr:
$
  E_text("gravitation") = - int (G M)/r (d M)/(d r) d r = - int 4 pi G rho(r) M(r) r d r
$
We also know that the absolute internal energy of an ideal gas to be:
$
  U = f/2 P V
$
Where $f$ denotes a quantity known as degrees of freedom. We write the following differential form considering the thermal energy of each spherical shell:
$
  d U_text("thermal") = f/2 P d V = (P)/(gamma-1) d V = (P)/(gamma-1) 4 pi r^2 d r = (4 pi K)/(gamma-1) r^2 rho^gamma d r
$
We consider each spherical shell and obtain the following thermal energy:
$
  E_text("thermal")= integral_0^R (4 pi K)/(gamma-1) r^2 rho^gamma d r
$
#pagebreak()
We write the final form of the energy as:
$
  E_text("total") = integral_0^R ((4 pi K)/(gamma-1) r^2 rho^gamma-4 pi G rho(r) M(r) r) d r
$
We will consider that minimising the energy and thus treating it as the analog of action, will end up obtaining an EOS for the stellar body. This is the principle of the following derivation.
== Interpretation
We require to use Lagrangian Field Theory in order to study the behaviour of this system properly. Here instead of using the standard $cal(L)$ Lagrangian it is replaced by a Lagrangian density. The explicit difference is in the way that both are defined. The lagrangian operates over a finite amount of generalised coordinates which is mathematically described as:
$
  cal(L)=L(q, dot(q),t)
$
Where the action $S$ is:
$
  S[q]= integral_(t_0)^(t_1) L(q, dot(q),t)d t
$
However, we are instead working with functionals which resemble scalar fields. In such cases it is much more common to work with the Lagrangian density which is represented as $cal(L)$ as well, since it is commonly referred to as the Lagrangian as well, in this specific definition:
$
  cal(L) (phi_i, nabla phi_i, (partial phi_i)/(partial t), bold(X), t) ~ cal(L)(phi_i, nabla phi_i, bold(X))
$
The removal of the partial differentiation of $phi_i$ reflects that there is no time-evolution in the system. The system we are studying is inherently static.
Where the action functional $cal(S)$ now is defined as:
$
  cal(S)[phi_i] = int cal(L) (phi_i, nabla phi_i, bold(X), t) d^3 x d t
$
Consider that the action functional is the analog of the total energy that we had described. Actually, it is more valid to refer our "action" as the total energy functional instead of action function. The validity of the Euler-Lagrange is not only valid for action functionals, letting us find extrema for our energy functional finds the minimum energy system of our static stellar body system. We will also consider that the time analog is the radius. Interesting, both time in the action functional for a standard lagrangian density and the radius we have described up to now are both independent variables, which describe the "path" of the action. Thus, they are fitting analogs. We can now write:
$
  cal(S)[phi_i] = int cal(L) (phi_i, nabla phi_i, (partial phi_i)/(partial t), bold(X), t) d^3 x d t ~ cal(E)[rho, M] = int cal(K)(rho, nabla rho, M, nabla M, r) d r
$
Where $cal(K)(rho, nabla rho, M, nabla M, r)=cal(L)(rho, nabla rho, M, nabla M, r) d V$. It is important to note that as our system is spherically symmetric and time-independent. The spatial integral will reduce from $d^3x arrow 4 pi int r^2 d r$. Additionally, as this is time-independent, there is no dependence of the energy functional on time $t$. Thus, our functional reduces to the form of $int cal(K) d r.$

#pagebreak()
== Euler-Lagrange with Lagrange Multiplier

We now apply the Euler-Lagrange equation with a caveat, $M$ is functionally related to $rho$ by the constraint $d M slash d r= 4 pi r^2 rho(r)$. In order to properly apply this to our case, we can assume that $M$ and $rho$ are not functionally related and introduce a Lagrange multiplier $lambda(r)$ and write the following:
$
  cal(F) = [(4 pi K rho^(gamma)r^2)/(gamma-1)-4 pi G rho(r)M(r)r+ lambda(r)[(d M)/(d r)-4 pi r^2 rho]]
$<F>
Differentiating @F with respect to $rho$ and using the following Euler-Lagrange of $rho(r)$ (The second term is 0 as $cal(F)$ as has no dependence on $rho'$):
$
  (partial cal(F))/(partial rho)- d/(d r)((partial cal(F))/(partial rho')) =0
$
$
  (partial cal(F))/(partial rho) = [(4 pi K gamma rho^(gamma-1)r^2)/(gamma-1) - 4 pi G M(r)r - 4 pi lambda (r) r^2] =0
$<pFpp>
Differentiating @F with respect to $M$:
$
  (partial cal(F))/(partial M) = -4 pi G rho(r) r
$
Then differentiating @F with respect to $M'$ and further differentiating with respect to $r$ and then applying the Euler-Lagrange for the mass:
$
  (partial cal(F))/(partial M') = lambda(r)
$
$
  d/(d r)((partial cal(F))/(partial M')) = lambda'(r)
$
$
  (partial cal(F))/(partial M) - d/(d r)((partial cal(F))/(partial M')) = 0
$
We obtain the following:
$
  lambda'(r)=-4 pi G rho(r)r
$<lmdad>

We can rewrite @pFpp such that $lambda$ is isolated:
$
  lambda(r) = (K gamma)/(gamma-1) rho^(gamma-1)-(G M)/r
$
Differentiating with respect to $r$:
$
  lambda ' = K gamma rho^(gamma-2) rho' - G ((d M)/(d r) 1/r -M/r^2)
$<fl>
We can use @lmdad in @fl, additionally using @dmdr we can obtain the following by isolating $M$
$
  M = - (K gamma)/G rho^(gamma-2) rho' r^2
$<M>
Differentiating @M with respect to $r$:
$
  M' = - (K gamma)/G d/(d r)(rho^(gamma-2)rho' r^2)
$
Rearranging and using @dmdr:
$
  1/r^2 d/(d r)(r^2 rho'rho^(gamma-2)) = - (4 pi G)/(K gamma) rho
$
Now using the non-dimensionalisation step from @rot, @rxi and @drodr, additionally using $gamma=1+1/n$:
$
  1/(alpha xi)^2 dot 1/alpha d/(d xi)((alpha xi )^2 ((rho_c n theta^(n-1))/alpha (d theta)/(d xi))(rho_c^(gamma-2) theta^(1-n)))=- (4 pi G)/(K gamma) rho_c theta^n
$
Simplifying and rearranging we obtain:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi))=-alpha^2 [(4 pi G rho_c)/(K (n+1) rho_c^(1/n))] theta^n
$
We can define $alpha$ as:
$
  alpha equiv [(K (n+1) rho^(1/n))/(4 pi G rho_c)]^(1/2)
$
We obtain the Lane-Emden again:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -theta^n
$

#pagebreak()

= Numerical and Analytical Analysis

After deriving the Lane-Emden equation, we now look for solutions with physically meaningful values of the polytropic index n. Exact analytical solutions exist only for n = 0, 1, and 5. Interestingly, there also exists a series solution for $n=2$. For other values, including the physically important cases n = 1.5 and n = 3, which model fully convective and radiative stars respectively. Do not have closed-form solutions and numerical methods are required. We restrict our analysis to $0 ≤ n <= 5$, since $n ≥ 5$ produces stars of infinite radius with limited physical relevance.

== Analytical Solutions
These are the cases where the Lane-Emden can be solved by using analytical techniques.
=== Case 1: Polytropic Index $n = 0$
When $n=0$, the term $theta^n arrow 1$, thus we write:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -1
$
Rearranging:
$
  d/(d xi)( xi^2 (d theta)/(d xi))=-xi^2
$
$
  xi^2 (d theta)/(d xi) = -int xi^2 d xi
$
$
  xi^2 (d theta)/(d xi) = -1/3 xi^3 + C_1
$
$
  (d theta)/(d xi) = -1/3 xi + C_1/(xi^2)
$
Integrating again:
$
  theta(xi) = -1/6 xi^2 -C_1/xi + C_2
$
We can use our initial conditions which we had discussed before, namely conditions 2 and 3:

2. At center of the star $xi=0$, $(d theta)/(d xi)=0$ or $theta'=0$.
3. At the center of the star $rho = rho_c$, from @rot we obtain: $theta(0)=1$.

From these we obtain:
$
  theta(xi) = 1-1/6 xi^2
$
#pagebreak()

=== Case 2: Polytropic Index $n=1$
When $n=1$, the term $theta^n arrow theta$, thus we can write:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -theta ==> theta'' + 2/xi theta' + theta =0
$
Assuming that a power series solution exists:
$
  theta(xi) = sum_(n=0)^infinity a_n xi^n
$
Finding $theta'$ and $theta''$:
$
  theta'(xi) = sum_(n=1)^infinity n a_n xi^(n-1), quad theta''(xi)=sum_(n=2)^infinity n(n-1)a_n xi^(n-2)
$
Substituting into the expanded form of the Lane-Emden:
$
  sum_(n=2)^infinity n(n-1) a_n xi^(n-2) + 2 sum_(n=1)^infinity n a_n xi^(n-2)+sum_(n=0)^infinity a_n xi^n = 0
$
We can simplify it to:
$
  sum_(n=2)^infinity n(n+1) a_n xi^(n-2) + sum_(n=0)^infinity a_n xi^n = 0
$
We can shift the first term such that it is in the form of $sum_(k=0)^infinity$, assume that $k=n-2$:
$
  sum_(n=2)^infinity n(n+1)a_n xi^(n-2) = sum_(k=0)^infinity (k+2)(k+3) a_(k+2) xi^(k)
$
Combining into a single series:
$
  sum_(k=0)^infinity [(k+2)(k+3) a_(k+2)+a_k] xi^k =0
$
For power series to be equal to 0, all the coefficients must also be 0:
$
  (k+2)(k+3) a_(k+2)+a_k =0
$
Rearranging:
$
  a_(k+2) = - (a_k)/((k+2)(k+3) )
$
We can apply the boundary conditions which we have discussed before to find that:
$
  a_0 = 1, a_1 = 0
$
However, we find $a_2, a_3, a_4 . . .$ by the recursive relation we found. We can write out the full equation and we find that:
$
  theta(xi) = 1 - xi^2/6 + xi^4/(120)-xi^6/5040 + ...
$
#pagebreak()
We will find that:
$
  sin(xi)= xi - xi^3/6 + xi^5/(120) - xi^7/5040 + ... => sin(xi)/(xi) = 1-xi^2/6 + xi^4/(120)-xi^6/5040 + ...
$
Thus:
$
  theta(xi) = sin(xi)/(xi)
$
=== Case 3: Polytropic Index $n = 5$
For $n=5$, the term $theta^n arrow theta^5$, thus we can write:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -theta^5 => theta''+2/xi theta' + theta^5 = 0
$
Assume that the functional form of $theta(xi)$ is quadratic:
$
  theta(xi) = (1+ a xi^2)^b
$
We can find $theta'$ and $theta''$:
$
  theta' = 2 a b xi (1+a xi^2)^(b-1), quad theta'' = 2 a b (1+a xi^2)^(b-1)+4a^2 b (b-1) xi (1+a xi^2)^(b-2)
$
We substitute it into the expanded Lane-Emden, and after some simplification:
$
  (1+ a xi^2)^(b-2)[6 a b(1+a xi^2)+4a^2 b (b-1) xi^2] + (1+a xi^2)^(5 b) = 0
$<quadex>
For this to be true, all the co-efficients of $(1+a xi^2)$ should match, which obtains:
$
  b-2 = 5b => b = -1/2
$
Which gives:
$
  theta(xi) = 1/(sqrt(1+a xi^2))
$
We can now substitute $b=-1/2$ into @quadex and simplify to obtain:
$
  (1+a xi^2)^(-5/2)-3a(1+a xi^2)^(-5/2) =0
$
Factoring:
$
  (1-3a)(1+a xi^2)^(-5/2) =0
$
As the quadratic cannot be 0 or negative:
$
  a = 1/3
$
Thus we obtain:
$
  theta(xi) = (1+ (xi^2)/3)^(-1/2)
$
=== Special Case: Polytropic Index $n=2$
As $n=2$, the term $theta^n arrow theta^2$, we can write:
$
  1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) = -theta^2 ==> theta'' + 2/xi theta'+theta^2=0
$
Assuming that a power series solution exists around $xi=0$:
$
  theta(xi) = sum_(n=0)^infinity a_n xi^n
$
Finding $theta'$ and $theta''$:
$
  theta'(xi) = sum_(n=1)^infinity n a_n xi^(n-1), quad theta''(xi)=sum_(n=2)^infinity n(n-1)a_n xi^(n-2)
$
Substituting into the expanded Lane-Emden:
$
  sum_(n=2)^infinity n(n+1)a_m xi^(m-2)+(sum_(n=0)^infinity a_n xi^n)^2=0
$
We can change the index of the left term and apply the Cauchy product on the right term:
$
  sum_(k=0)^infinity (k+2)(k+3)a_(k+2) xi^k + sum_(k=0)^infinity (sum_(j=0)^k a_j a_(k-j)) xi^k = 0
$
We can combine the series to obtain:
$
  sum_(k=0)^infinity [(k+2)(k+3)a_(k+2)+sum_(j=0)^k a_j a_(k-j)] xi^k = 0
$
As the series converges to 0, it must also only have coefficients of value 0:
$
  (k+2)(k+3)a_(k+2)+sum_(j=0)^k a_j a_(k-j) =0
$
Rearranging we obtain the following recurrence:
$
  a_(k+2) = - 1/((k+2)(k+3)) sum_(j=0)^k a_j a_(k-j)
$
From the boundary conditions putting it in the Lane-Emden:
$
  theta(0)=1, theta'(0)=0 arrow a_0 = 1, a_1 = 0
$
We can now calculate different values of index $j=1, 3 , 5...$ focusing on odd terms:
$
  a_3 = -1/12(a_0 a_1+ a_1 a_0) = 0
$
$
  a_5 = -1/30(a_0 a_3 + a_1 a_2 +a_2 a_1 + a_3a_0) = 0
$
Turns out, by method of induction, it can be shown that $a_(2k+1)=0$

Introducing a series such that: $b_n:=a_(2 n)$, the power series becomes:
$
  theta = sum_(n=0)^infinity b_m xi^(2n)
$
In the recurrence relation, we can set $k=2n$, the recurrence becomes:
$
  a_(2n+2) = -1/((2n+2)(2n+3)) sum_(j=0)^(2n)a_j a_(2n-j)
$
Notice that the odd coefficients are 0 and thus can set $k = 2r$ and use $b_r = a_(2r)$, we obtain:
$
  b_(n+1) = -1/((2n+2)(2n+3)) sum_(r=0)^(m)b_r b_(n-r)
$
By using the initial conditions and the recursive relation we can obtain a series:
$
  theta(xi) = 1- xi^2/6 + xi^4/60 - (11 xi^6)/(7560)+ ...
$
It is important to establish that this is not an analytical solution and will only give better approximations when the series is expanded for higher order. Interestingly, the radius of the physical stellar body is at $xi_1 approx 4.3528$. Moreover, this series converges for $xi<=15.7179$, this is due to the fact that there exists two singularities at $xi approx pm 15.7179i$, thus the radius of convergence is not infinite. Deriving this is not taken up as additional numerical analysis is required for it.

#pagebreak()
== Numerical Analysis

I will be using Python 3.13.11, numpy, matplotlib and scipy in order to carry out the numerical analysis. Using the solve_ivp module from scipy in order to solve the ODE. The reason for this choice is nothing other than just familiarity for me. I assume any other method such as odeint should also work.

As the Lane-Emden is a 2nd order ODE, we will need to represent it instead as a coupled 1st order ODE instead as solve_ivp is unable to solve 2nd order ODEs. In order to do so consider the two substitutions:
$
  u_1 = theta, u_2 = (d theta)/(d xi)
$
The Lane-Emden can thus be decomposed to:
$
  (d u_1)/(d xi) = u_2, quad (d u_2)/(d xi) = -u_1^n - 2/ xi u_2
$
The code which encodes the above is taken up by a defined function called the _lane_emden_:
```py
def lane_emden(xi, J, n):
    u1, u2 = J
    if u1 <= 0:
        return [u2, 0]
    return [u2, -(u1**n) - 2*u2/xi]
```
Another thing to note is that the term $u_1^n$ will have to be dealt with more caution as when working in Python, if u_1 becomes a negative quantity, we can face issues with the numerical process as if $n$ is not an integer value, then the calculation can break. The way I dealt with this is by doing the following: adding the _if_ statement in the above code, which returns the vector J as [$u_2, 0$]; introducing a _surface.at_ event which stops the process of calculation at the first instance of $theta=0$.
```c
def surface_at(xi, J, n):
    u1, u2 = J
    return u1

surface_at.terminal  = True
surface_at.direction = -1
```
The way this works is when the value of $u_1$ becomes 0, it returns _False_ which makes triggers the _surface.at_ event and it has to be manually set that the _.terminal_ property of the event is to be set to _True_. The _.direction_ property is used to detect how exactly the crossing event occurs, in this case, it must be always be such that $theta>0 arrow theta<0$.
```c
def solve(n):
    xi_i = 1e-8
    xi_f = 80
    u1_0 = 1 - xi_i**2 / 6
    u2_0 = -xi_i / 3
    sol = solve_ivp(
        lane_emden,
        [xi_i, xi_f],
        [u1_0, u2_0],
        events       = surface_at,
        args         = (n,),
        dense_output = True,
        max_step     = 0.01
    )
    return sol
```
The above _solve_ function take a value of $n$ and uses the _lane_emden_ function as one of its parameters and solves it using the solve_ivp module from scipy. Internally, it uses the Runge-Kutta method of order 5(4). This is an iterative numerical technique which is used to solve ODEs. Exact information about the function is documented in the python file itself. The rest of the file deals with just the appearance and how the graph is represented. Using the code, we obtain the following graph:
#align(center)[
  #image("assets/Lane-Emden_Polytropes.png", width: 500pt)
]
Interestingly, the case of the $n=5$ has an infinite radius, this actually shows that the $n=5$ polytrope and beyond do not have any physical relevance. However, certain special cases do. Such as $n=1.5$, which model the non-relativistic degenerate electron masses such as fully convective low-mass stars and low-mass white dwarves. For $n=3$, it can model relativistic white-dwarves or radiation pressure dominated star.

However, as we will see shortly, these polytropes are only approximations and have their limitations.


#image("assets/image-20.png")

#figure(
  table(
    columns: 4,
    align: center,

    [$n$], [$xi_1$], [$theta'(xi_1)$], [$-xi_1^2 theta'(xi_1)$],

    [0], [2.44949], [-0.81658], [4.89695],
    [1], [3.14159], [-0.31785], [3.13710],
    [1.5], [3.65375], [-0.20332], [2.71428],
    [2], [4.35287], [-0.12732], [2.41236],
    [3], [6.89685], [-0.04243], [2.01808],
  ),
  caption: [Numerically computed Lane–Emden constants.],
)<tab:lane-emden>
#pagebreak()

== Comparison of Lane-Emden Model with Stellar Observational Data

=== Radius Comparison

From the numerical analysis, we conducted in the previous section. We have found the radius of the surface and the distribution of the stellar mass. In order to compare what the ability of the Lane-Emden equation is able to predict with respect to stellar observations, we need to make certain assumptions and then see if it stays valid for other quantities.

To do so, we must convert the $xi$ back to radius $r$. Once, this has been calculated we can actually start to compare it to real stellar observation. We know that $r = alpha xi$. Correctly, determining the value of $alpha$ will determine the value of $r$. Previously from the relationship of $alpha$ we found before:
$
  alpha equiv [(K (n+1) rho^(1/n))/(4 pi G rho_c)]^(1/2)
$
In order to get started on our comparative work, let us take the polytropic index $n=3$, which represents a radiation pressure dominated star/a relativistic white dwarf:
$
  alpha = [(K)/(pi G rho_c^(2 slash 3))]^(1/2)
$
Here we have to determine both $rho_c$ and $K$, in order to do so we can use one of the values from a standard model called the "Model S" @ChristensenDalsgaard1996, which is sourced from the Christensen-Dalsgaard solar model data and we try to see if another values follow the same standard value. The difference of those values from the standard and the extent to which it is does, will give an idea for how accurate the Lane-Emden equation is.

Assuming the following value from the Model S, that the $rho_c= 1.622 times 10^5 text("kg/m")^3$ and that $P_c=2.477 times 10^16 text("Pa")$ . Using this we can determine $alpha$ and $K$ as $K = P_c slash rho_c^(4 slash 3)$ at the centre.

Computing we find, $alpha = 6.707 times 10^7 text("m")$. We know that the surface of a $n=3$ star is determined to be $xi_1 = 6.897$ from the numerical analysis. We can determine the radius of the surface from $r = alpha xi$ to be $r=4.625 times 10^8 text("m")$. This is the radius that is determined by the Lane-Emden Model. However, the standard value of $R_⊙$ is determined to be $R_⊙= 6.957 times 10^8 text("m")$. The error which the Lane-Emden has as compared to observational data is calculated from the following:
$
  %text("Error in Radius Determination") & = (|R_⊙-r|)/(R_⊙)times 100 \
                                         & = (|6.957 times 10^8 - 4.625 times 10^8|)/(6.957 times 10^8) times 100
$
$
  text("%Error")= 33.52%
$
This result indicates that while the Lane-Emden equation provides a reasonable approximation, it cannot perfectly reproduce a realistic stellar model. This is primarily because the Sun has a radiative core, roughly modelled by $n = 3$, and a convective envelope, better described by $n = 1.5$ @Collins1989[§2.4]. A single polytropic index cannot capture this structural transition, limiting the accuracy of the model. Of course, there exist other factors such as nuclear energy production. Sedek et al. @Sedek2016 extended this framework by developing composite polytropic models consisting of two and three distinct regions corresponding to the Sun's convective, radiative, and nuclear zones. These models were calibrated against the Standard Solar Model of Bahcall, Serenelli, and Basu @BahcallSerenelliBasu2005. Their results showed that a three-zone composite polytrope reproduces the internal solar structure with reasonable accuracy, overcoming some of the limitations associated with describing the entire stellar body using a single polytropic index.

=== Mass Comparison
In order to be able to numerically find $M$, we use the equation which describes the relation between mass $M$ and radius $r$. However, since our analysis was done using the variable $xi$ and $theta$, we have to perform the following manipulation:
$
  (d M)/(d r) = 4 pi r^2 rho(r)
$
$
  integral_0^R d M = 4 pi rho_c alpha^3 integral_0^(xi_1) theta^n xi^2 d xi
$
We can substitute the Lane-Emden equation into the integral, $theta^n = -1 slash xi^2 dot d slash d xi (xi^2 (d theta slash d xi))$:
$
  M = 4 pi rho_c alpha^3 integral_0^(xi_1) -1/xi^2 d/(d xi)(xi^2 (d theta)/(d xi)) xi^2 d xi
$
$
  M = -4 pi rho_c alpha^3 integral_0^(xi_1) d/(d xi)(xi^2 (d theta)/(d xi))d xi
$
From the fundamental theorem of calculus and the boundary condition $d theta slash d xi$ at $0=0$
$
  M = -4 pi rho_c alpha^3 xi_1^2 (d theta)/(d xi)stretch(|, size: #200%)_(xi=xi_1)
$
We can now use our numerical analysis and use the flag which finds the gradient at the surface in order to find the mass $M$.
From @tab:lane-emden, we know that for the polytropic index $n=3$ the term $-xi_1^2 (d theta slash d xi) stretch(|, size: #100%)_(xi=xi_1) = 2.018$. We can thus compute M substituting the values of $rho_c$ and $alpha$ which we had determined before and find it to be $M = 1.241 times 10^30 text("kg")$. We know from the standard value of solar mass $M_⊙$ to be $M_⊙ = 1.989 times 10^30 text("kg")$, so the error we find is the following:
$
  % "Error in Mass Determination" & = abs((M_⊙ - M) / M_⊙) times 100 \
                                  & = abs(
                                      (1.989 times 10^30 - 1.241 times 10^30)
                                      / (1.989 times 10^30)
                                    ) times 100 \
                                  & = abs(
                                      (0.748 times 10^30)
                                      / (1.989 times 10^30)
                                    ) times 100 \
                         %"Error" & = 37.61%
$
The 37.61% error in predicted mass is comparable in magnitude to the 33.52% radius error found in §3.3.1.
This consistency suggests both discrepancies share a common reason, the inability of a single polytropic index to capture the structural transition between the solar radiative core and convective envelope.
A model that better reproduces one quantity would likely improve the other simultaneously, since both depend on the same underlying density profile.

=== Density Profile

The Model S @ChristensenDalsgaard1996 has an online repository of the standard solar data. Using the repository and plotting it against the density profile of the Lane-Emden, we can graphically and numerically observe the accuracy of the Lane-Emden Equation to predict a density profile. The repository and the code which I used to plot it will be listed in the GitHub repository for ease of access. A more detailed explanation of the code is written in the code itself. However, I will explain the code generally here as well.

Using the _scipy_ library in a similar fashion to §3.2. We can evaluate the function for $n=3$ only. We can download the Model S data in a _.txt_ file and use _np.loadtxt_ in order to parse the text file. Storing the data in terms of arrays. Additionally, the Model S data is stored in terms of CGS units, so we convert to SI for familiarity and consistency. Moreover, the array is to be reversed as the Model S stores the data from surface to center. We can reproduce the calculations in §3.3.1 in order to evaluate the radius $r$ and density $rho$ for each point from the Lane-Emden. There is a normalisation step, which constraints each of the graphical variables from $0$ to $1$.  We have to perform an interpolation in order to compare the densities of the same radius. Which constructs a continuous density function of the Lane-Emden from which we evaluate the continuous density function at the points of the Model S only. We also find the RMS error and maximum error by computing it using:
$
  text("%RMS Error") = sqrt(1/N sum_(i=1)^N (Delta rho_i)^2)times 100,quad text("%Maximum Error") = text("max")_i|Delta rho_i| times 100
$
The maximum error is found by finding the index of the array which stores the maximum difference.

The following plot is obtained:

#align(center)[
  #image("assets/ModS_Pol.png", width: 450pt)]

#pagebreak()

Some additional data which is printed in the terminal is shown in the table below:

#figure(
  caption: [Quantitative comparison between the Model S density profile and the $n=3$ polytropic model.],

  table(
    columns: (2.1fr, 3fr, 1.2fr, 2.0fr),
    stroke: 0.5pt,

    [Metric], [Definition], [Value], [Interpretation],

    [RMS error], [$sqrt((1/N) sum (Delta rho)^2)$], [0.0272], [2.72% Average Deviation],

    [Maximum absolute \ error], [$max abs(Delta rho)$], [0.0517], [5.17% Largest Deviation],

    [Radius of maximum \ discrepancy],
    [$r slash R_⊙$ at $max abs(Delta rho)$],
    [0.2277],
    [Largest Deviation at 0.2277 $R_⊙$ ],
  ),
)

From the data and comparison, we can observe that the Lane-Emden is able to predict the regions of the density with acceptable accuracy, even if the model is simplistic. It has the largest deviation at the region where the $r slash R_⊙ = 0.2277$. When comparing to the Model S, it is stated that in a similar region of $0.2277R_⊙$, approximately $0.2R_⊙$, the boundary of the nuclear burning core and the radiative core exists. This suggests that the discrepancy of Lane-Emden to predict this region stems from the singular polytropic nature of the curve, it is unable to model the behaviour of the boundary accurately.

= Conclusion




The goal of this paper/pedagogical review of the Lane-Emden was a way to understand with more depth and intuition of the Lane-Emden. The reason I find this to be an interesting way to get into stellar modelling as this is quite simplistic and can be understood without much mathematical background. However, it shows the nature of how stellar modelling is handled in a more scientific manner. Additionally, on a more personal note, this is done almost entirely by me and it was my first time trying to make a piece of educational content. It has also fueled my interest in the subject of stellar modelling. There will be changes in the document as needs be. 


#bibliography("references.bib", full: true)

