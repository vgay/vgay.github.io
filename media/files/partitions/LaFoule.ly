\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

voltaOnCue = \markup  \pad-around #0.5 \text \fontsize #4 \bold  "Last x"

title = #"La Foule"
composer = #"Ángel Cabral"
meter = #"(Valse)"
kwtempo = #"Medium"
kwstyle = #"Valse"
kwfrench = #"Oui"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score
             markFormatter = #format-mark-box-alphabet }
  \context { % \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
    %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s2 s2. a:m6 s e:m9 s b:7 s e:m s e:m s
  e:m7+ s a:m7 s d:7 s g:6 s
  b:7 s e:m7+ s c:7 s b:7 s b:7 e:m7+ s
  d:7 s g:6 s d:7 s g:6 s
  b:7 s e:m7+ s c:7 s b:7 s b:7 e:m7+ s
  a:m6 s e:m9 s b:7 s e:m s e:m s e:m
}

harmoniesV = \chordmode {
  \set chordChanges = ##f
  s4
  e2.:m7+ s a:m7 s d:7 s g:6 s
  b:7 s e:m7+ s c:7 s b:7 s b:7 e:m7+ s
  d:7 s g:6 s d:7 s g:6 s
  b:7 s e:m7+ s c:7 s b:7 s b:7 e:m7+ s
  %a:m6 s e:m9 s b:7 s e:m s e:m s e:m
}


theNotes =  \relative c'' {
  \clef "treble" \key g \major \time 3/4 \Intro
  \partial 2 b4 c | cis d dis |
  \repeat volta 2 {
    <a c e>8 q r <a c fis> q4 | <a c e>8 q r <a c fis> q4 |
    <g b e>8 q r <g b fis'> q4 | <g b e>8 q r <g b fis'> q4 | \break
    <a b dis>8 q r <a b fis'> q4 | <a b dis>8 q r <a b fis'> q4 |
  }
  \alternative {
    { <g b e>4 b c | cis d dis } { <g, b e>4 r r | r4 r  ais8 b }
  } \break  \bar "||-[|:"
  \repeat volta 2 {
    \mark #1
    e4. dis8 e fis | g4. fis8 e dis | e4 c2 | r2 e8 fis |
    a4. g8 g fis | a4. d,8 d e | d2. | r4 r ais8 b | \break
    dis4. dis8 dis e | fis4. 8 e dis | e4 b2 | r4 e4 e | c4. 8 8 8 }
  \alternative {
    { e4. 8 fis e | dis2. | r4 r ais8 b }
    { b4. b8 dis dis | e2. | r8 d e d cis d }
  } \bar "||-[|:" \break
  \repeat volta 2 {
    \mark #2
    fis4. e8 e d | fis4. e8 e d | g4. e8 e d | g e4 e4 d8 |
    fis4. e8 e d | fis d4 e4 c8 | b2. | r8 b c b ais b \break
    dis4. dis8 dis e | fis8 4. e8 dis | fis4 e r8 e | e e e e e e | e e4. 8 8
  }
  \alternative {
    { e4 g g | fis2. | r8 d e d cis d }
    { dis4 g fis | e b c | cis d dis }
  } \break \bar "||-[|:"
  \repeat volta 2 {
    \mark #3
    <a c e>8 q r <a c fis> q4 | <a c e>8 q r <a c fis> q4 |
    <g b e>8 q r <g b fis'> q4 | <g b e>8 q r <g b fis'> q4 | \break
    <a b dis>8 q r <a b fis'> q4 | <a b dis>8 q r <a b fis'> q4 |
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \tweak self-alignment-X #RIGHT
    \mark \markup  \with-color #(x11-color 'red) "To Coda"
  }
  \alternative {
    { <g b e>4 b c | cis d dis } { <g, b e>4 r r | r8 b c b ais b \break \bar "|."}
  }
  \mark \markup \with-color #(x11-color 'red) \bold \musicglyph #"scripts.varcoda"
  <g b e>8 e dis e g b | <g b e>4  r r
  \bar ".."
}

theNotesV =  \relative c'' {
  \clef "treble" \key g \major \time 3/4
  \partial 1 ais8 b
  \bar "||-[|:"
  \repeat volta 2 {
    \mark #1
    e4. dis8 e fis | g4. fis8 e dis | e4 c2 | r2 e8 fis | \break
    a4. g8 g fis | a4. d,8 d e | d2. | r4 r ais8 b | \break
    dis4. dis8 dis e | fis4. 8 e dis | e4 b2 | r4 e4 e | c4. 8 8 8 }
  \alternative {
    { e4. 8 fis e | dis2. | r4 r ais8 b }
    { b4. b8 dis dis | e2. | r8 d e d cis d }
  } \bar "||-[|:" \break
  \repeat volta 2 {
    \mark #2
    fis4. e8 e d | fis4. e8 e d | g4. e8 e d | g e4 e d8 | \break
    fis4. e8 e d | fis d4 e c8 | b2. | r8 b c b ais b \break
    dis4. 8 8 e | fis8 4. e8 dis | fis4 e r8 e | e e e e e e | e e4.  8 8 \break
  }
  \alternative {
    { e4 g g | fis2. | r8 d e d cis d }
    { dis4 g fis | e2. | R }
  } \break \bar "||-[|:"

  %   \mark \markup \with-color #(x11-color 'red) \bold \musicglyph #"scripts.varcoda"
  %   <g b e>8 e dis e g b | <g b e>4  r r
  \bar ".."
}

chordsRhythm = \relative c'' {

}

Basse = \relative c {
  \clef "bass" \key g \major \time 3/4
  \partial 2 r2 | R2. |
  \repeat volta 2 {
    a4 a' a | a, a' a |
    e, e' e | b e e |
    fis, b' b | b, b' b |
  }
  \alternative {
    { e,, r r | R2. } {e4 b' g | e r r  }
  }
  s2.*40
  %a4 a' a | a, a' a |
  e4 e' e | b e e |
  fis, b' b | b, b' b |
  { e,, r r | R2. } {e4 b' g | e r r  } {e4 b' g | e r r  }
}

grille = \chordmode {
  \bar "[|:"

  \repeat volta 2 {
    \repeat percent 2 e1:m7+ \repeat percent 2 a:m7 \break
    \repeat percent 2 d:7 \repeat percent 2 g:6 \break
    \repeat percent 2 b:7 \repeat percent 2 e:m \break }
  \set Score.repeatCommands = #'((volta "1"))
  \repeat percent 2 c:7 \repeat percent 2 b:7 \break
  \set Score.repeatCommands = #'((volta #f) (volta "2") end-repeat)
  c:7 b:7 \repeat percent 2 e:m7+ \set Score.repeatCommands = #'((volta #f))

  \repeat volta 2 {
    d:7/a d:7 g:6 g:6/d \break
    d:7/a d:7 g:6 g:6/d \break
    \repeat percent 2 b:7 \repeat percent 2 e:m \break
  }
  \set Score.repeatCommands = #'((volta "1"))
  \repeat percent 2 c:7 \repeat percent 2 b:7 \break
  \set Score.repeatCommands = #'((volta #f) (volta "2") end-repeat)
  c:7 b:7 \repeat percent 2 e:m7+ \set Score.repeatCommands = #'((volta #f))
  \repeat volta 2 {
    \repeat percent 2 a1:m6 \repeat percent 2 e:m9 \break
    \repeat percent 2 b:7 e:m e:m \break }
}

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*19
  s1 ^\markup \bold \box \fontsize #5 B s1*19
  s1 ^\markup \bold \box \fontsize #5 C
}

verse = \lyricmode {

  Je re -- vois la ville en fête et en dé -- li -- re
  Suf -- fo -- quant sous le so -- leil et sous la joie
  Et j’en -- tends dans la mu -- sique les cris, les ri -- res
  Qui é -- clatent et re -- bon -- dissent au -- tour de moi
  Et per \repeat unfold 10 { \skip 1 }
  fou -- le  qui nous traî -- ne
  Nous en -- traî -- ne
  É -- cra -- sés l’un con -- tre l’au -- tre
  Nous ne for -- mons qu’un seul corps
  Et le flot sans ef -- fort
  Nous pousse, en -- chaî -- nés l’un et l’au -- tre
  Et nous lai -- sse tous deux
  É -- pa -- nouis, en -- i -- vrés et heu -- reux.
  En -- traî -- nés par la
}

verseB = \lyricmode {
  \repeat unfold 2 { \skip 1 }
  due par -- mi ces gens qui me bous -- cu -- lent
  É -- tour -- die, dés -- em -- pa -- rée, je res -- te là
  Quand sou -- dain, je me re -- tourne, il se re -- cu -- le,
  Et la foule vient me je \repeat unfold 7 { \skip 1 } ter en -- tre ses bras...
  Em -- por -- tés par la

  fou -- le qui s’é -- lan -- ce
  Et qui dan -- se
  U -- ne fol -- le fa -- ran -- do -- le
  Nos deux mains res -- tent sou -- dées
  Et par -- fois sou -- le -- vés
  Nos deux corps en -- la -- cés s’en -- vo -- lent
  Et re -- tom -- bent tous deux
  É -- pa -- nouis, en -- i \repeat unfold 9 { \skip 1 } vrés et heu -- reux...
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      << \new StaffGroup \with { instrumentName = \CleSol }
         <<
           \new ChordNames { \harmonies }
           \new Staff \theNotes
           \new Staff \Basse
         >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    }
    %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new StaffGroup  \with { instrumentName = \Bb }
        <<
          \new ChordNames { \transpose c d \harmonies }
          \new Staff \transpose c d \theNotes
          \new Staff \transpose c d \Basse
        >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new StaffGroup  \with { instrumentName = \Eb }
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \transpose c a, \theNotes
          \new Staff \transpose c a \Basse
        >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      << \new StaffGroup \with { instrumentName = \CleSol }
         <<
           \new ChordNames { \harmonies }
           \new Staff \theNotes
           \new Staff \Basse
         >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    }
    %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new StaffGroup  \with { instrumentName = \Bb }
        <<
          \new ChordNames { \transpose c d \harmonies }
          \new Staff \transpose c d \theNotes
          \new Staff \transpose c d \Basse
        >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new StaffGroup  \with { instrumentName = \Eb }
        <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \transpose c a, \theNotes
          \new Staff \transpose c a \Basse
        >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    } %\form %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    ragged-last = ##f
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      << \new StaffGroup \with { instrumentName = \CleSol }
         <<
           \new ChordNames { \harmoniesV }
           \new Staff
           \theNotesV
           \addlyrics \verse
           \addlyrics \verseB
         >>
      >>
      \layout {
        \context {
          \Staff
          \RemoveEmptyStaves
      } }
    }
    \markup {
      \vspace #1
      \fill-line {
        \column {
          \line { \small { "("\box A "2nd X )" } }
          \line { Et la joie éclaboussée par son sourire }
          \line { Me transperce et rejaillit au fond de moi }
          \line { Mais soudain je pousse un cri parmi les rires }
          \line { Quand la foule vient l’arracher d’entre mes bras... }
    } } }
    \markup {
      \vspace #1
      \fill-line { \hspace #2
                \column {
          \line { Emportés par la foule qui nous traîne }
          \line { Nous entraîne }
          \line { Nous éloigne l’un de l’autre }
          \line { Je lutte et je me débats }
          \line { Mais le son de sa voix }
          \line { S’étouffe dans les rires des autres }
          \line { Et je crie de douleur, de fureur et de rage }
          \line { Et je pleure... }
        } \hspace #2
                \column {
          \line { Emportés par la foule qui nous traîne }
          \line { Nous entraîne }
          \line { Nous éloigne l’un de l’autre }
          \line { Je lutte et je me débats }
          \line { Mais le son de sa voix }
          \line { S’étouffe dans les rires des autres }
          \line { Et je crie de douleur, de fureur et de rage }
          \line { Et je pleure... }
        } \hspace #2

      }
    }
  }
}